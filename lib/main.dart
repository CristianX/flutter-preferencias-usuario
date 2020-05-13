import 'package:flutter/material.dart';

// Vistas
import 'package:preferenciasusuario/src/pages/home_page.dart';
import 'package:preferenciasusuario/src/pages/settings_page.dart';

// share_prefs
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';
 
void main() async {

  // Corección de errores de carga de preferencias
  WidgetsFlutterBinding.ensureInitialized();
  // Llamando preferencias de usuario para cuando está cargando la aplicación
  final prefs = new PreferenciasUsuario();
  // Para que no se ejecute la aplicación hasta que las preferecias hayan sido cargadas e inicializadas
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',

      // otra forma de usar rutas
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName     : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName : ( BuildContext context ) => SettingsPage(),
        
      },
    );
  }
}