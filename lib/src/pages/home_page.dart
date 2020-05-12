
import 'package:flutter/material.dart';

// Widgets
import 'package:preferenciasusuario/src/widgets/menuLateral_widget.dart';

class HomePage extends StatelessWidget {

// Definiendo nombre de la página para otra forma de enrutamiento
static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Preferencias de usuario'),
       ),

      //  Menu lateral
      drawer: MenuLateralWidget(),

       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text('Color secundario:'),
           Divider(),
           Text('Género:'),
           Divider(),
           Text('Nombre Usuario:'),
           Divider()
         ],
       ),
      
    );
  }
}