import 'package:flutter/material.dart';

class DragGame extends StatefulWidget {
  @override
  _DragGameState createState() => _DragGameState();
}

class _DragGameState extends State<DragGame> {
  Color warnaBg = Colors.grey;
  Offset pos = Offset(50, 50);
  bool accepted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: pos.dy,
              left: pos.dx,
              child: accepted
                  ? Container()
                  : Draggable(
                      feedback: Container(
                        color: Colors.blue[100],
                        height: 200,
                        width: 200,
                      ),
                      child: Container(
                        color: Colors.blue,
                        height: 200,
                        width: 200,
                      ),
                      childWhenDragging: Container(),
                      onDraggableCanceled: (view, offset) {
                        setState(() {
                          pos = offset;
                        });
                      },
                      data: "kotak",
                    ),
            ),
            Positioned(
              top: 500,
              left: 100,
              child: DragTarget(
                builder: (context, List<String> data, rj) {
                  return Container(
                    color: warnaBg,
                    width: 200,
                    height: 200,
                  );
                },
                onAccept: (data) {
                  if (data == 'kotak') {
                    setState(() {
                      warnaBg = Colors.blue[700];
                      accepted = true;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
 