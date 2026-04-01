import 'package:flutter/material.dart';
import 'package:tianqi_forecast/models/city.dart';


class CityCard extends StatefulWidget {
  final City city;
  final void Function()? onTap;

  const CityCard({
    super.key,
    required this.city,
    this.onTap,
  });

  @override
  State<CityCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<CityCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20) ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Color(0xFF1E293B).withAlpha(100),
          border: BoxBorder.all(color: Color(0xFF334155).withAlpha(127)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                // Text(
                //   "Current location".toUpperCase(),
                //   style: TextStyle(
                //     color: Color(0xFF4B91E2),
                //     fontSize: 12,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                SizedBox(height: 4),
                Text(
                  widget.city.name,
                  style: TextStyle(
                    color: Color(0xFFF1F5F9),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    // Icon(
                    // WeatherIconMapper.getIconData(widget.weather.current.weatherCode),
                    // color: WeatherIconMapper.getIconColor(widget.weather.current.weatherCode)),
                    // Text(
                    //   WeatherIconMapper.getWeatherDescription(widget.weather.current.weatherCode),
                    //   style: TextStyle(
                    //     color: Color(0xFF94A3B8),
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 14,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            // Text(
            //   "${widget.weather.current.temperature2m} °",
            //   style: TextStyle(
            //     color: Color(0xFFF1F5F9),
            //     fontSize: 48,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
