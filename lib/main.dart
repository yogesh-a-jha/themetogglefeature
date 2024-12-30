import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // A boolean to track the theme (light/dark)
  bool _isDarkTheme = false;

  // Random quotes and facts
  final List<String> quotes = [
    "“The only way to do great work is to love what you do.” – Steve Jobs",
    "“Success is not final, failure is not fatal: It is the courage to continue that counts.” – Winston Churchill",
    "“The only limit to our realization of tomorrow is our doubts of today.” – Franklin D. Roosevelt",
    "Did you know? The Eiffel Tower can grow by up to 15 cm during the summer due to the expansion of the iron in the heat.",
    "Motivation is what gets you started. Habit is what keeps you going. – Jim Ryun",
    "The Earth’s core is as hot as the sun’s surface, approximately 5,500°C!"
  ];

  // Function to get 3 random quotes
  List<String> getRandomQuotes() {
    return List.generate(3, (index) {
      return quotes[(DateTime.now().millisecondsSinceEpoch + index) % quotes.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light, // Toggle theme based on state
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Random Quotes & Facts',
            style: TextStyle(
              color: _isDarkTheme ? Colors.white : Colors.black, // Heading color based on theme
            ),
          ),
          actions: [
            Switch(
              value: _isDarkTheme,
              onChanged: (bool value) {
                setState(() {
                  _isDarkTheme = value;
                });
              },
              activeColor: Colors.blue,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Section for Random Quotes and Facts
              Text(
                'Quotes & Facts:',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _isDarkTheme ? Colors.white : Colors.black, // Adjust heading color based on theme
                    ),
              ),
              SizedBox(height: 10),
              ...getRandomQuotes().map((quote) => Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        quote,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
