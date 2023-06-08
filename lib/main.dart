import 'package:flutter/material.dart';
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

  void _showMenu(BuildContext context, String player) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: 150.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              CircularButton(
                imagePath: "assets/sword.png",
                label: 'Simple',
                onPressed: () {
                  _handleOptionSelected(context, player, 'Simple');
                }
              ),
              CircularButton(
                imagePath: "assets/swords.png",
                label: 'Compound',
                onPressed: () {
                  _handleOptionSelected(context, player, 'Compound');
                }
              ),
              CircularButton(
                imagePath: "assets/rpg-game.png",
                label: 'Parry/Riposte',
                onPressed: () {
                  _handleOptionSelected(context, player, 'Parry/Riposte');
                }
              ),
              CircularButton(
                imagePath: "assets/decision.png",
                label: 'Remise',
                onPressed: () {
                  _handleOptionSelected(context, player, 'Remise');
                }
              ),
              CircularButton(
                imagePath: "assets/switch.png",
                label: 'Counter',
                onPressed: () {
                  _handleOptionSelected(context, player, 'Counter');
                }
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleOptionSelected(BuildContext context, String player, String option) {
    // Handle the selected option here
    print('Player $player selected $option');
    Navigator.pop(context); // Close the secondary menu
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

class CircularButton extends StatelessWidget{
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
  Widget build(BuildContext context){
    return Container(
      height: 80.0,
      width: 80.0,
      margin: EdgeInsets.all(16.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 32.0,
              height: 32.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0,),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0
              ),
            ),

          ],
        ),
      ),
    );
  }
}

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
