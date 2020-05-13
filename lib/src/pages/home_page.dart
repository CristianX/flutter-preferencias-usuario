
import 'package:flutter/material.dart';

// share-prefs
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';

// Widgets
import 'package:preferenciasusuario/src/widgets/menuLateral_widget.dart';

class HomePage extends StatelessWidget {

 // Definiendo nombre de la página para otra forma de enrutamiento
  static final String routeName = 'home';

  // Llamando preferencias en este punto para que no ejecute el build nuevamente
  final prefs = new PreferenciasUsuario();

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
           Text('Género: ${ prefs.genero }'),
           Divider(),
           Text('Nombre Usuario:'),
           Divider()
         ],
       ),
      
    );
  }
}