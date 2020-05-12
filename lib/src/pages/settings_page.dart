import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

// Definiendo nombre de la página para otra forma de enrutamiento
static final String routeName = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Ajustes'),
       ),
       body: Center(
         child: Text('Ajustes Page'),
       )
      
    );
  }
}