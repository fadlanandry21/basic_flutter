import 'package:flutter/material.dart';

void main() {
  runApp(MyRowContainerApp());
}

class MyRowContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar layout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RowContainerLayoutPage(),
    );
  }
}

class RowContainerLayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tes row container'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Contoh 1: Row Sederhana
            Text(
              'Row Sederhana',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                  child: Center(child: Text('Red')),
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.green,
                  child: Center(child: Text('Green')),
                ),
                SizedBox(width: 10),
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.blue,
                  child: Center(child: Text('Blue')),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Contoh 2: Row dengan Styling Container
            Text(
              'Row dengan Container',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'ini Container (ceritanya) ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: Center(
                    child: Text(
                      'ini Juga ',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            // Contoh 3: Row dengan Expanded
            Text(
              'Row dengan Expanded',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.teal,
                    child: Center(child: Text('Lebar 2')),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                    child: Center(child: Text('Lebar 1')),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.deepPurple,
                    child: Center(child: Text('Lebar 1')),
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
