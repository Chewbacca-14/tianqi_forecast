import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tianqi_forecast/core/ui/screens/weather_screen.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:tianqi_forecast/core/ui/widgets/custom_text_field.dart';
import 'package:tianqi_forecast/core/ui/widgets/weather/weather_card.dart';
import 'package:tianqi_forecast/models/weather.dart';
import 'package:tianqi_forecast/models/weather_enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  final List<Weather> weatherEnum = WeatherEnum.getAllWeatherModels();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121820),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cities',
              style: TextStyle(
                color: Color(0xFFF1F5F9),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              decoration: BoxDecoration(
                color: Color(0xFF1E293B).withAlpha(100),

                borderRadius: BorderRadius.circular(24),
              ),
              controller: searchController,
              height: 36,
              hintText: "Search for a city",
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFF94A3B8),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: weatherEnum.length,
                itemBuilder: (context, index) {
                  final weather = weatherEnum[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: WeatherCard(
                      weather: weather,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WeatherScreen(weather: weather)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
