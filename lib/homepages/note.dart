import 'package:flutter/material.dart';
import 'dart:ui';

class DrawingBoard extends StatefulWidget {
  const DrawingBoard({super.key});

  @override
  State<DrawingBoard> createState() => _DrawingBoardState();
}

class _DrawingBoardState extends State<DrawingBoard> {


  Color selectedColor = Colors.black;
  double strokeWidth = 5;
  List<DrawingPoint> drawingPoints = [];
  List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellow,
    Colors.amberAccent,
    Colors.green,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onPanStart: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    offset: details.localPosition,
                    paint: Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                    isStroke: false, // Indicate this is a new stroke
                  ),
                );
              });
            },
            onPanUpdate: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    offset: details.localPosition,
                    paint: Paint()
                      ..color = selectedColor
                      ..isAntiAlias = true
                      ..strokeWidth = strokeWidth
                      ..strokeCap = StrokeCap.round,
                    isStroke: true, // Indicate this is part of a stroke
                  ),
                );
              });
            },
            onPanEnd: (details) {
              setState(() {
                drawingPoints.add(
                  DrawingPoint(
                    offset: null, // Set offset to null to indicate the end of the current stroke
                    paint: Paint(), // Create a new Paint for the next stroke
                    isStroke: false, // Indicate the end of the current stroke
                  ),
                );
              });
            },
            child: CustomPaint(
              painter: _DrawingPainter(drawingPoints),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 30,
            child: Row(
              children: [
                Slider(
                  value: strokeWidth,
                  onChanged: (val) => setState(() => strokeWidth = val),
                  min: 1.0,
                  max: 10.0, // Set a range for the slider
                ),
                ElevatedButton.icon(
                  onPressed: () => setState(() => drawingPoints.clear()), // Clear the drawingPoints list
                  icon: Icon(Icons.clear),
                  label: Text("Clear Board"),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              colors.length,
                  (index) => _buildColorChoice(colors[index]),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildColorChoice(Color color) {
    bool isSelected = selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        height: isSelected ? 47 : 40,
        width: isSelected ? 47 : 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected ? Border.all(color: Colors.white, width: 3,) : null,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;
  _DrawingPainter(this.drawingPoints);

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsetsList = [];

    for (int i = 0; i < drawingPoints.length - 1; i++) {
      if (!drawingPoints[i].isStroke) {
        offsetsList.clear();
      } else if (drawingPoints[i].offset != null &&
          drawingPoints[i + 1].offset != null) {
        canvas.drawLine(
          drawingPoints[i].offset!,
          drawingPoints[i + 1].offset!,
          drawingPoints[i].paint,
        );
      } else if (drawingPoints[i].offset != null &&
          drawingPoints[i + 1].offset == null) {
        offsetsList.add(drawingPoints[i].offset!);
        canvas.drawPoints(
          PointMode.points,
          offsetsList,
          drawingPoints[i].paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DrawingPoint {
  Offset? offset;
  Paint paint;
  bool isStroke;

  DrawingPoint({
    required this.offset,
    required this.paint,
    required this.isStroke,
  });
}


