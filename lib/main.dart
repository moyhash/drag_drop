import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Color Variable
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    // POur que je puisse supprimé
    final showDrag = color == Colors.black;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag & Drop'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DragTarget<Color>(
              onAccept: (data) => setState(() => color = data),
              builder: (context, _, __) => Container(
                color: color, // Ppur la couleur change apres drop
                width: 200,
                height: 200,
              ),
            ),
            IgnorePointer(
              ignoring: !showDrag,
              child: Opacity(
                // Condition 
                opacity: showDrag ? 1 : 0,
                child: Draggable<Color>(
                  // Enregistrer la couleur
                  data: Colors.blue,
                  feedback: Container(
                    color: Colors.lightBlueAccent,
                    width: 200,
                    height: 200,
                  ),
                  childWhenDragging: Container(
                    color: Colors.grey,
                    width: 200,
                    height: 200,
                  ),
                  child: Container(
                    color: Colors.blue,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
