import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Pertemuan 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text(
          'Tugas Pertemuan 4',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Box 1 - Blue
            Container(
              width: 230,
              height: 150,
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Text(
                'Box 1',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Box 2 and Box 3 - Red and Green
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Box 2 - Red
                Container(
                  width: 105,
                  height: 150,
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text(
                    'Box 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Box 3 - Green
                Container(
                  width: 105,
                  height: 150,
                  color: Colors.green,
                  alignment: Alignment.center,
                  child: const Text(
                    'Box 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
