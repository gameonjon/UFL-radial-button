

import 'package:flutter/material.dart';
import 'dart:math' as math;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Player buttons',
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {


  void _showMenu(BuildContext context, String player) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 350.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final centerX = constraints.maxWidth / 2;
              final centerY = constraints.maxHeight/2;
              
              final buttonSize = 60.0;
              final radius = 55.0;
              //for top and left at the end it should be:
                //radius - buttonSize / 2

            
              return Stack(
                children: [
                  Positioned(
                    top: centerY + math.sin(0 * 1.256) * radius - buttonSize / 2,
                    left: centerX + math.cos(0 * 1.256) * radius - buttonSize / 2,
                    child: CircularButton(
                      imagePath: "assets/sword.png",
                      label: 'Simple',
                      onPressed: (){
                        _showThirdMenu(context, 
                          player, 
                          'Simple', 
                          centerY + math.sin(0 * 1.256) * radius - buttonSize / 2,
                          centerX + math.cos(0 * 1.256) * radius - buttonSize / 2,
                        );
                      }, 
                    ),
                  ),
                  Positioned(
                    top: centerY + math.sin(1 * 1.256) * radius - buttonSize / 2,
                    left: centerX + math.cos(1 * 1.256) * radius - buttonSize / 2,
                    child: CircularButton(
                      imagePath: "assets/swords.png",
                      label: 'Compound',
                      onPressed: (){
                        _showThirdMenu(context, 
                          player, 
                          'Compound',
                          centerY + math.sin(1 * 1.256) * radius - buttonSize / 2,
                          centerX + math.cos(1 * 1.256) * radius - buttonSize / 2,
                        );
                      },  
                    ),
                  ),
                  Positioned(
                    top: centerY + math.sin(2 * 1.256) * radius - buttonSize / 2,
                    left: centerX + math.cos(2 * 1.256) * radius - buttonSize / 2,
                    child: CircularButton(
                      imagePath: "assets/rpg-game.png",
                      label: 'Parry/Riposte',
                      onPressed: (){
                        _showThirdMenu(context, 
                          player, 
                          'Parry/Riposte',
                          centerY + math.sin(2 * 1.256) * radius - buttonSize / 2,
                          centerX + math.cos(2 * 1.256) * radius - buttonSize / 2,
                        );
                      },  
                    ),
                  ),
                  Positioned(
                    top: centerY + math.sin(3 * 1.256) * radius - buttonSize / 2,
                    left: centerX + math.cos(3 * 1.256) * radius - buttonSize / 2,
                    child: CircularButton(
                      imagePath: "assets/decision.png",
                      label: 'Remise',
                      onPressed: (){
                        _showThirdMenu(context, 
                          player, 
                          'Remise',
                          centerY + math.sin(3 * 1.256) * radius - buttonSize / 2,
                          centerX + math.cos(3 * 1.256) * radius - buttonSize / 2,
                        );
                      },  
                    ),
                  ),
                  Positioned(
                    top: centerY + math.sin(4 * 1.256) * radius - buttonSize / 2,
                    left: centerX + math.cos(4 * 1.256) * radius - buttonSize / 2,
                    child: CircularButton(
                      imagePath: "assets/switch.png",
                      label: 'Counter',
                      onPressed: (){
                        _showThirdMenu(context, 
                          player, 
                          'Counter',
                          centerY + math.sin(4 * 1.256) * radius - buttonSize / 2,
                          centerX + math.cos(4 * 1.256) * radius - buttonSize / 2,
                        );
                      }, 
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _showThirdMenu(BuildContext context, String player, String option, double top, double left ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: top,
              left: left-14.0,
              child: FloatingActionButton.small(
                onPressed: () {
                  _handleOptionSelected(context, player, option, 'Hit');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: top,
              left: left + 28.0,
              child: FloatingActionButton.small(
                onPressed: () {
                  _handleOptionSelected(context, player, option, 'Miss');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Miss',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        );
      },
    );
  }

  void _handleOptionSelected(BuildContext context, String player, String option, String hm) {
    // Handle the selected option here
    print('$player selected $option, its a $hm');
    Navigator.pop(context); // Close the third menu
    Navigator.pop(context);
    // widget.onPressed(); // call the original onPressed callback
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Assuming you have a video widget playing the recording here
          Positioned.fill(
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: 600,
                  height: 900,
                  child: VideoPlayerWidget(),
                ),
              ),
            ),
          ),
          PlayerButton(
            alignment: Alignment.bottomLeft,
            onPressed: () {
              _showMenu(context, 'Player 1');
            },
            label: 'Player 1',
          ),
          PlayerButton(
            alignment: Alignment.bottomRight,
            onPressed: () {
              _showMenu(context, 'Player 2');
            },
            label: 'Player 2',
          ),
        ],
      ),
    );
  }
  
}

class PlayerButton extends StatelessWidget {
  final Alignment alignment;
  final VoidCallback onPressed;
  final String label;

  const PlayerButton({
    Key? key,
    required this.alignment,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: FloatingActionButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const CircularButton({
    Key? key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 22.0,
              height: 22.0,
              color: Colors.white,
            ),
            SizedBox(height: 2.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 8.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class CircularButton extends StatefulWidget {
//   final String imagePath;
//   final String label;
//   final VoidCallback onPressed;

//   const CircularButton({
//     Key? key,
//     required this.imagePath,
//     required this.label,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   _CircularButtonState createState() => _CircularButtonState();
// }

// class _CircularButtonState extends State<CircularButton> {
//   bool _isHolding = false;

  

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTapDown: (_) {
//         setState(() {
//           _isHolding = true;
//         });
//       },
//       onTapUp: (_) {
//         setState(() {
//           _isHolding = false;
//         });
//         _showThirdMenu(context);
//       },
//       onTapCancel: () {
//         setState(() {
//           _isHolding = false;
//         });
//       },
//       child: Container(
//         height: 60.0,
//         width: 60.0,
//         child: FloatingActionButton(
//           onPressed: () {},
//           backgroundColor: _isHolding ? Colors.green : Colors.blue,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 widget.imagePath,
//                 width: 22.0,
//                 height: 22.0,
//                 color: Colors.white,
//               ),
//               SizedBox(height: 2.0),
//               Text(
//                 widget.label,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 8.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// Replace this widget with your own video player widget that plays the recording
class VideoPlayerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          'Video Recording',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
