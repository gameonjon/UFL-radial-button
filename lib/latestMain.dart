// import 'dart:html';

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
            // painter: MyPainter(),
            painter: radialPainter(), 
            // foregroundPainter: paintText(),

          ),
        ),
        
      ),
    );
  }

}

class radialPainter extends CustomPainter {
  
  @override 
  void paint(Canvas canvas, Size size){
    //textPainter requirements
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: 'Hsimple attackd.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text:  textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 60,
    );

    //semi-circle requirements
    var curvesPaint = Paint()
      ..color = Colors.grey;
    var edgePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    
    Offset center = Offset(150, 80);
    final arcRect = Rect.fromCircle(center: center, radius: 150);
    var textPaintStuff = PaintTextStuff('Simple Attack'); 

    var startAngle = vector_math.radians(0);
    var sweepAngle = vector_math.radians(60);

    //============ first block

    var offset = Offset(200, 100);
    // var centerOfTri = findCenter(150, 80, 300, y2, x3, y3)
    // var centerOfSemi = findSemiCenter(150, 0, 150);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);

    
    // textPainter.paint(canvas, offset);
    textPaintStuff.paint(canvas, offset);
    // textPainter.paint(canvas, centerOfSemi);

    //============= second semi-circle
    startAngle = vector_math.radians(60);
    sweepAngle = vector_math.radians(60);
    // textSpan = TextSpan(text: 'Simple Attack');
    offset = Offset(120, 170);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);

    textPaintStuff = PaintTextStuff('Compound');
    textPaintStuff.paint(canvas, offset);

    //========  third semi-circle
    startAngle = vector_math.radians(120);
    sweepAngle = vector_math.radians(60);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);
    // PaintText(x: 150, y: 90);
    // CustomPaint(painter: PaintText(x: 150, y: 90),);

    offset = Offset(40, 100);
    textPaintStuff = PaintTextStuff('Parry/Riposte');
    textPaintStuff.paint(canvas, offset);
    
    
    //========== fourth semi-circle
    startAngle = vector_math.radians(180);
    sweepAngle = vector_math.radians(60);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);

    offset = Offset(40, 30);
    textPaintStuff = PaintTextStuff('Remise');
    textPaintStuff.paint(canvas, offset);

    //=========== fifth semi-circle
    startAngle = vector_math.radians(240);
    sweepAngle = vector_math.radians(60);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);

    offset = Offset(120, -40);
    textPaintStuff = PaintTextStuff('Counter-attack');
    textPaintStuff.paint(canvas, offset);

    //sixth semi-circle
    startAngle = vector_math.radians(300);
    sweepAngle = vector_math.radians(60);

    canvas.drawArc(arcRect, startAngle, sweepAngle, true, curvesPaint);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, edgePaint);
    offset = Offset(200, 30);
    textPaintStuff = PaintTextStuff('Point in');
    textPaintStuff.paint(canvas, offset);
  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}



class PaintText extends CustomPainter{

  // final Offset prop;
  // const paintText({Key key}) : super(key: key);
  dynamic x, y;
  PaintText({this.x, this.y});

  @override 
  void paint(Canvas canvas, Size size){
    //textPainter requirements
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: 'Hsimple attackd.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text:  textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: 60,
    );
    const offset = Offset(150, 90);
    

    textPainter.paint(canvas, offset);

  }

  @override 
  bool shouldRepaint(CustomPainter oldDelegate){
    return false;
  }
}

TextPainter PaintTextStuff(stringText) {

  var text = stringText;
  final textStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
  );
  final textSpan = TextSpan(
    text: text,
    style: textStyle,
  );
  final textPainter = TextPainter(
    text:  textSpan,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(
    minWidth: 0,
    maxWidth: 80,
  );
  const offset = Offset(150, 90);
  

  return textPainter;

}

Offset findCenter(x1, y1, x2, y2, x3, y3) {
  double x, y;

  var temp = x1 + x2 + x3;
  temp /= 3;
  x = temp;

  temp = y1 + y2 + y3;
  y = temp / 3;


  return Offset(x, y);
}

Offset findSemiCenter(x, y, r){
  double x1, y1;

  x1 = (x/2) + 130;

  y1 = (4 * r) / (3*3.14);
  y1 += 40;

  return Offset(x1, y1);
}

class MyPainter extends CustomPainter {
  @override 
  void paint(Canvas canvas, Size size){
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 30
    );
    final textSpan = TextSpan(
      text: 'Hello, world.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text:  textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );

    final offset = Offset(50, 100);
    textPainter.paint(canvas, offset);
  }

  @override 
  bool shouldRepaint(CustomPainter old){
    return false;
  }
}

class CirclePainter extends CustomPainter {
  @override 
  void paint(Canvas canvas, Size size){
    var paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 15;
      // ..style = PaintingStyle.stroke
      // ..strokeCap = StrokeCap.square;

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

