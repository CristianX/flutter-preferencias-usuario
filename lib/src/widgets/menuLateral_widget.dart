import 'package:flutter/material.dart';

// Vistas
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';

class MenuLateralWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      // Lo tradicional es almacenar un ListView
      child: ListView(
        // Para que ocupe todo el espacio
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/original.jpg'),
                fit: BoxFit.cover
              )
            )
          ),
          // Opciones del menú
          ListTile(
            leading: Icon( Icons.pages, color: Colors.blue ),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
          ),
          ListTile(
            leading: Icon( Icons.party_mode, color: Colors.blue ),
            title: Text('Party Mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon( Icons.people, color: Colors.blue ),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon( Icons.settings, color: Colors.blue ),
            title: Text('Configuración'),
            onTap: (){
              // Para cerrar menú lateral
              // Navigator.pop(context);

              // Para cambiar vista raíz
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),

    );
  }
}