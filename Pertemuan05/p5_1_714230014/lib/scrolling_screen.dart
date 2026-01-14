import 'package:flutter/material.dart';

/// ScrollingScreen - Demonstrasi berbagai jenis ListView
class ScrollingScreen extends StatelessWidget {
  const ScrollingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List data untuk demonstrasi dynamic list
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrolling Screen'),
      ),
      body: ListView(
        children: <Widget>[
          // Section 1: Basic ListView
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Basic ListView',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '2',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: const Center(
              child: Text(
                '3',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),

          // Section 2: Dynamic List dengan map()
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Dynamic List dengan map()',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Menggunakan map() untuk membuat widget dari list
          ...numberList.map((number) {
            return Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: const TextStyle(fontSize: 50),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// ListViewBuilder - Demonstrasi ListView.builder
/// Lebih efisien untuk list dengan banyak item
class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.builder'),
      ),
      body: ListView.builder(
        itemCount: numberList.length, // Jumlah item yang akan ditampilkan
        itemBuilder: (BuildContext context, int index) {
          // Builder dipanggil untuk setiap item
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// ListViewSeparated - Demonstrasi ListView.separated
/// Menambahkan separator (pemisah) di antara item
class ListViewSeparated extends StatelessWidget {
  const ListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView.separated'),
      ),
      body: ListView.separated(
        itemCount: numberList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Text(
                '${numberList[index]}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          // Separator yang ditampilkan di antara item
          return const Divider(
            color: Colors.red,
            thickness: 3,
          );
        },
      ),
    );
  }
}
