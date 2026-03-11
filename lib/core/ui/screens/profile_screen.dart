import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tianqi_forecast/core/ui/widgets/profile/color_switcher.dart';
import 'package:tianqi_forecast/core/ui/widgets/profile/profile_avatar.dart';
import 'package:tianqi_forecast/models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User _user = User(email: "example@gmail.com");
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    ;
  }

  /// Загрузка изображения на сервер
  Future<void> _uploadImage(File? imageFile) async {
    if (imageFile == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Здесь ваша логика загрузки на сервер
      // Например, через API сервис
      final uploadedUrl = await _uploadToServer(imageFile);

      // Обновляем пользователя с новым URL аватара
      setState(() {
        _user = _user.copyWith(avatarUrl: uploadedUrl);
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Аватар успешно обновлен')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка загрузки: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// Загрузка на сервер (пример)
  Future<String> _uploadToServer(File imageFile) async {
    // Имитация загрузки
    await Future.delayed(const Duration(seconds: 2));

    // Здесь должен быть реальный API вызов
    // final response = await api.uploadAvatar(imageFile);
    // return response.data['url'];

    return 'https://example.com/uploaded_avatar.jpg';
  }

  /// Сохранение URL аватара
  Future<void> _saveUrl(String? imageUrl) async {
    if (imageUrl == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Валидация URL (можно добавить проверку, что изображение доступно)
      if (!imageUrl.startsWith('http://') && !imageUrl.startsWith('https://')) {
        throw Exception('Неверный формат URL');
      }

      // Сохраняем URL в пользователе
      setState(() {
        _user = _user.copyWith(avatarUrl: imageUrl);
      });

      // Здесь можно сохранить на сервере
      // await api.updateUserAvatar(_user.id, imageUrl);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL аватара сохранен')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121820),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile',
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 100,),
            Center(
              child: Column(
                children: [
                  ProfileAvatar(
                    imageUrl: _user.avatarUrl,
                    radius: 50,
                    isEditable: true,
                    dialogTitle: 'Фото профиля',
                    galleryText: '📱 Выбрать из галереи',
                    urlText: '🌐 Указать ссылку',
                    deleteText: '🗑 Удалить фото',
                    cancelText: '✕ Отмена',
                    onImageSelected: _uploadImage,
                    onUrlSelected: _saveUrl,
                  ),
                  SizedBox(height: 30,),
                  if (_user.email != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      _user.email!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                  SizedBox(height: 30,),
                  CompactColorSwitch(lightColor: Colors.white,darkColor: Color(0xFF121820),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
