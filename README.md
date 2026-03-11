1. CustomTextField - remove isPassword, make just isObscure
2. CustomButton - remove fontSize param, make not required, make ElevatedButton
3. User - email, createdAt, lastLogin
4. WeatherCard - padding must be like containers param, not in child
5. WeatherAnnotations - padding must be like containers param, not in child
6. resolve all "problems"
7. CompactColorSwitch - instead of  _isDark ? widget.darkColor : widget.lightColor make Color getter
8. ProfileAvatar - make just circle with icon
9. WeatherScreen - " ${weather.temp}°" why space ?
10. auth screen - maybe another - xx == true ? 
11. WeatherIconExtension better make not on String, but on Weather object (LATER)