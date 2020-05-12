import 'package:flutter/material.dart';

// Widget
import 'package:preferenciasusuario/src/widgets/menuLateral_widget.dart';

// Dependencia de preferencias
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

// Definiendo nombre de la página para otra forma de enrutamiento
static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Cristian';

  // Controller del campo de teto
  TextEditingController _textController;

  // Cuando se inicie el página
  @override
  void initState() { 
    super.initState();

    cargarPref();
    
    _textController = new TextEditingController( text: _nombre );
  }

  // Para llamarlo al initState
  cargarPref() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();

    // Llamando preferencias con llave de 'genero'
    _genero = prefs.getInt('genero');

    setState(() {});
  }

  _setRadioSeleccionado( int valor ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Guardando preferencias con llave de 'genero'
    prefs.setInt('genero', valor);
    _genero = valor;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Ajustes'),
       ),
      //  Aplicando menú lateral
       drawer: MenuLateralWidget(),
       body: ListView(
         children: <Widget>[
           Container(
             padding: EdgeInsets.all(5.0),
             child: Text('Configuración', style: TextStyle( fontSize: 45.0, fontWeight: FontWeight.bold )),
           ),

          //  Crea una línea de separación
           Divider(),
           SwitchListTile(
             value: _colorSecundario, 
             title: Text('Color secundario'),
             onChanged: ( value ){ 
              //  Para redibujar
               setState(() {
               _colorSecundario = value;
               });
              },
            ),

            RadioListTile(
              value: 1, 
              title: Text('Masculino'),
              groupValue: _genero,
              onChanged: _setRadioSeleccionado,
            ),
            RadioListTile(
              value: 2, 
              title: Text('Femenino'),
              groupValue: _genero,
              onChanged: _setRadioSeleccionado,
            ),
            
            Divider(),

            Container(
              padding: EdgeInsets.symmetric( horizontal: 20.0 ),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre completo'
                ),
                onChanged: ( value ) {},
              ),
            )
         ],
       )
      
    );
  }
}