import 'package:draggable_widget_flutter/page_three.dart';
import 'package:draggable_widget_flutter/page_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PageThree(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color caughtColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GeeksforGeeks'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Draggable Widget
            Draggable(
                data: Colors.orangeAccent,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                  child: const Center(
                    child: Text('box'),
                  ),
                ),
                // calling onDraggableCanceled property

                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: 150,
                  height: 150,
                  color: Colors.orangeAccent.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      'Box...',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                )),

            // building Drag Target Widget
            DragTarget(
              onAccept: (Color color) {
                caughtColor = color;
              },
              builder: (
                BuildContext context,
                List<dynamic> accepted,
                List<dynamic> rejected,
              ) {
                return Container(
                  width: 200,
                  height: 200,
                  color: accepted.isEmpty ? caughtColor : Colors.grey.shade200,
                  child: const Center(
                    child: Text('Drag here'),
                  ),
                );
              },
              onLeave: (color){

              },
            ),
          ],
        ),
      ),
    );
  }
}
