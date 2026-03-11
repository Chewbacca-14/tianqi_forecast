import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileAvatar extends StatefulWidget {
  /// URL изображения из интернета
  final String? imageUrl;

  /// Локальный файл изображения
  final File? imageFile;

  /// Радиус аватарки
  final double radius;

  /// Можно ли редактировать (показывать иконку камеры)
  final bool isEditable;

  /// Цвет фона для заглушки
  final Color? backgroundColor;

  /// Колбэк при выборе нового изображения
  final Function(File? imageFile)? onImageSelected;

  /// Колбэк при выборе URL изображения
  final Function(String? imageUrl)? onUrlSelected;

  /// Колбэк при ошибке
  final Function(String error)? onError;

  /// Показывать ли диалог выбора источника
  final bool showSourceDialog;

  /// Заголовок диалога
  final String? dialogTitle;

  /// Текст для пункта "Из галереи"
  final String? galleryText;

  /// Текст для пункта "Из интернета по URL"
  final String? urlText;

  /// Текст для пункта "Удалить фото"
  final String? deleteText;

  /// Текст для пункта "Отмена"
  final String? cancelText;

  const ProfileAvatar({
    Key? key,
    this.imageUrl,
    this.imageFile,
    this.radius = 40,
    this.isEditable = false,
    this.backgroundColor,
    this.onImageSelected,
    this.onUrlSelected,
    this.onError,
    this.showSourceDialog = true,
    this.dialogTitle,
    this.galleryText,
    this.urlText,
    this.deleteText,
    this.cancelText,
  }) : super(key: key);

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  File? _selectedImageFile;
  String? _selectedImageUrl;
  final ImagePicker _picker = ImagePicker();
  String? _lastError;
  final TextEditingController _urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedImageFile = widget.imageFile;
    _selectedImageUrl = widget.imageUrl;
  }

  @override
  void didUpdateWidget(ProfileAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.imageFile != oldWidget.imageFile) {
      setState(() {
        _selectedImageFile = widget.imageFile;
      });
    }
    if (widget.imageUrl != oldWidget.imageUrl) {
      setState(() {
        _selectedImageUrl = widget.imageUrl;
      });
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  /// Показать диалог выбора источника
  Future<void> _showSourceSelectionDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.dialogTitle ?? 'Выберите источник изображения'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.blue),
                title: Text(widget.galleryText ?? 'Из галереи'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              ListTile(
                leading: const Icon(Icons.link, color: Colors.green),
                title: Text(widget.urlText ?? 'По URL из интернета'),
                onTap: () {
                  Navigator.pop(context);
                  _showUrlInputDialog();
                },
              ),
              if (_hasImage())
                ListTile(
                  leading: const Icon(Icons.delete, color: Colors.red),
                  title: Text(widget.deleteText ?? 'Удалить фото'),
                  onTap: () {
                    Navigator.pop(context);
                    _clearImage();
                  },
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(widget.cancelText ?? 'Отмена'),
            ),
          ],
        );
      },
    );
  }

  /// Показать диалог ввода URL
  Future<void> _showUrlInputDialog() async {
    _urlController.text = _selectedImageUrl ?? '';

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Введите URL изображения'),
          content: TextField(
            controller: _urlController,
            decoration: const InputDecoration(
              hintText: 'https://example.com/image.jpg',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Отмена'),
            ),
            ElevatedButton(
              onPressed: () {
                final url = _urlController.text.trim();
                if (url.isNotEmpty) {
                  Navigator.pop(context);
                  _setImageFromUrl(url);
                }
              },
              child: const Text('Загрузить'),
            ),
          ],
        );
      },
    );
  }

  /// Выбор изображения из галереи
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );

      if (pickedFile != null) {
        final file = File(pickedFile.path);
        setState(() {
          _selectedImageFile = file;
          _selectedImageUrl = null;
          _lastError = null;
        });

        if (widget.onImageSelected != null) {
          widget.onImageSelected!(file);
        }
      }
    } catch (e) {
      _handleError('Ошибка при выборе изображения: $e');
    }
  }

  /// Установка изображения по URL
  void _setImageFromUrl(String url) {
    // Простая валидация URL
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      _handleError('Пожалуйста, введите корректный URL (начинающийся с http:// или https://)');
      return;
    }

    setState(() {
      _selectedImageUrl = url;
      _selectedImageFile = null;
      _lastError = null;
    });

    if (widget.onUrlSelected != null) {
      widget.onUrlSelected!(url);
    }
  }

  /// Очистка изображения
  void _clearImage() {
    setState(() {
      _selectedImageFile = null;
      _selectedImageUrl = null;
    });

    if (widget.onImageSelected != null) {
      widget.onImageSelected!(null);
    }
    if (widget.onUrlSelected != null) {
      widget.onUrlSelected!(null);
    }
  }

  /// Проверка наличия изображения
  bool _hasImage() {
    return _selectedImageFile != null ||
        (_selectedImageUrl != null && _selectedImageUrl!.isNotEmpty);
  }

  /// Обработка ошибок
  void _handleError(String error) {
    setState(() {
      _lastError = error;
    });

    if (widget.onError != null) {
      widget.onError!(error);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  /// Получение провайдера изображения
  ImageProvider? _getImageProvider() {
    // Приоритет: локальный файл > URL > null
    if (_selectedImageFile != null) {
      return FileImage(_selectedImageFile!);
    }

    if (_selectedImageUrl != null && _selectedImageUrl!.isNotEmpty) {
      return CachedNetworkImageProvider(
        _selectedImageUrl!,
        errorListener: (object) => _handleError('Ошибка загрузки изображения по URL'),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEditable
          ? (widget.showSourceDialog ? _showSourceSelectionDialog : _pickImageFromGallery)
          : null,
      child: Stack(
        children: [
          // Основная аватарка
          CircleAvatar(
            radius: widget.radius,
            backgroundColor: widget.backgroundColor ?? Colors.grey[200],
            backgroundImage: _getImageProvider(),
            child: _getImageProvider() == null
                ? Icon(
              Icons.person,
              size: widget.radius,
              color: Colors.grey[600],
            )
                : null,
          ),

          // Иконка редактирования
          if (widget.isEditable)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 2,
                  ),
                ),
                child: CircleAvatar(
                  radius: widget.radius * 0.3,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.edit,
                    size: widget.radius * 0.3,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          // Индикатор загрузки для URL изображений
          if (_selectedImageUrl != null && _selectedImageFile == null)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: Center(
                  child: SizedBox(
                    width: widget.radius * 0.5,
                    height: widget.radius * 0.5,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}