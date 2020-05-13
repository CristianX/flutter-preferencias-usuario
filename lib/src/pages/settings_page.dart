import 'package:flutter/material.dart';

// Widget
import 'package:preferenciasusuario/src/widgets/menuLateral_widget.dart';


// share_prefs
import 'package:preferenciasusuario/src/share_prefs/preferencias_usuario.dart';


class SettingsPage extends StatefulWidget {

// Definiendo nombre de la página para otra forma de enrutamiento
static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  // String _nombre = 'Cristian';

  // Controller del campo de teto
  TextEditingController _textController;

  // Inicializando preferencias de usuario
  final prefs = new PreferenciasUsuario();  

  // Cuando se inicie el página
  @override
  void initState() { 
    super.initState();

    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    
    _textController = new TextEditingController( text: prefs.nombreUsuario );
  }

  

  _setRadioSeleccionado( int valor ) {

    // Guardando preferencias con llave de 'genero'
    // prefs.setInt('genero', valor);

    // Usando Getters y Setters
    prefs.genero = valor;
    _genero = valor;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        title: Text('Ajustes'),
        backgroundColor: ( prefs.colorSecundario ) ? Colors.teal : Colors.blue
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
              //  Uso de preferencias_usuario
              prefs.colorSecundario = value;
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
                onChanged: ( value ) {
                  // Llamando preferencias_usuario
                  prefs.nombreUsuario = value;
                },
              ),
            )
         ],
       )
      
    );
  }
}