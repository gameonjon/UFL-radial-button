import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector_math;

enum ActionItem { simple, compound, parryRiposte, remise, counter }

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: PainterFunction()
    );
  }

}

class PainterFunction extends StatelessWidget{

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom paint Demo'),
      ),
      body: Container(
        child: Center(
          child: CustomPaint(
            size: Size(300, 200),
            // painter: LinePainter(),
            // painter: CirclePainter(),
            painter: radialPainter(),

          ),
        ),
      ),
    );
  }

}

class radialPainter extends CustomPainter {
  @override 
  void paint(Canvas canvas, Size size){

    var curvesPaint = Paint()
      ..color = Colors.grey;
    
    Offset center = Offset(150, 80);
    final arcRect = Rect.fromCircle(center: center, radius: 150);
    var startAngle = vector_math.radians(5);
    var sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);

    startAngle = vector_math.radians(70);
    sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);

    startAngle = vector_math.radians(135);
    sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);

    startAngle = vector_math.radians(200);
    sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);

    startAngle = vector_math.radians(265);
    sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);

    startAngle = vector_math.radians(330);
    sweepAngle = vector_math.radians(65);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
  }

  void paint2(Canvas canvas, Size size){
    Offset center = Offset(150, 80);
    final arcRect = Rect.fromCircle(center: center, radius: 150);
    final startAngle = vector_math.radians(70);
    final sweepAngle = vector_math.radians(130);

    var curvesPaint = Paint()
      ..color = Colors.grey;

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override 
  void paint(Canvas canvas, Size size){
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 15;

    Offset center = Offset(size.width/2, size.height/2);

    canvas.drawCircle(center, 150, paint);
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

