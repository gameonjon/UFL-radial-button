import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum ActionItem { simple, compound, parryRiposte, remise, counter }

void main() => runApp(const PopupMenuApp());

class PopupMenuApp extends StatelessWidget {
  // A widget that does not require mutable state.
  // A stateless widget is a widget that describes 
  //  part of the user interface by building a 
  //  constellation of other widgets that describe 
  //  the user interface more concretely.
  const PopupMenuApp({super.key});  //constructor

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: PopupMenuExample(),
    );
  }
}

class PopupMenuExample extends StatefulWidget{
  //A widget that has mutable state.
  // State is information that (1) 
  //  can be read synchronously when 
  //  the widget is built and (2) might 
  //  change during the lifetime of the widget
  const PopupMenuExample({super.key}); //constructor

  @override
  State<PopupMenuExample> createState() => _PopupMenuExampleState();
}

class _PopupMenuExampleState extends State<PopupMenuExample>{
  ActionItem? selectedMenu;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('PopupMenuButtt')),
      body: Center(
        child: PopupMenuButton<ActionItem>(
          initialValue: selectedMenu,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          onSelected: (ActionItem item){
            setState(() {
              selectedMenu = item;
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<ActionItem>>[
            const PopupMenuItem<ActionItem>(
              value: ActionItem.simple,
              child: Text('Simple Attack'),
            ),
            const PopupMenuItem<ActionItem>(
              value: ActionItem.compound,
              child: Text('Compound'),
            ),
            const PopupMenuItem<ActionItem>(
              value: ActionItem.parryRiposte,
              child: Text('Parry/Riposte'),
            ),
            const PopupMenuItem<ActionItem>(
              value: ActionItem.remise,
              child: Text('Remise'),
            ),
            const PopupMenuItem<ActionItem>(
              value: ActionItem.counter,
              child: Text('Counterattack'),
            ),
          ],
        )
      ),
    );
  }
}
