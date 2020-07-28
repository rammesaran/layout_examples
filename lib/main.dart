import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//MyApp is the root of the widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
            tooltip: "TAP",
          ),
          title: Text('This is TITLE'),
          actions: <Widget>[Icon(Icons.satellite), Icon(Icons.zoom_out_map)],
        ),
        body: MyCustomWidget(),
      ),
    );
  }
}

class MyCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
        ),
        height: deviceSize.height,
        width: deviceSize.width,
        //height: 500,

        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: Image.asset('assets/im.jpg')),
              ],
            ),
            Row(
              children: [
                Expanded(child: Image.asset('assets/im.jpg')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
