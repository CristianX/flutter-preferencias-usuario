// Dependencia de preferencias
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  // Implementación patrón singleton para antes de dibujar los StalessWidgets y para saber que página el usuario visitó
  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  // Cuando se ejecute el constructor retornará la instancia ya creada
  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  // Inicializando prefs para poder consumirla después
  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }


  // Ninguna de estas propiedades se usa
  // bool _colorSecundario;
  // int _genero;
  // String _nombre;

  // GETTERS Y SETERS del género
  get genero {
    // ?? indica que la propiedad por defecto o el valor por defecto será 1
    return _prefs.getInt('genero') ?? 1;
  }

  set genero( int value ) {

    _prefs.setInt('genero', value);

  }


  // GETTERS Y SETERS del Color Secundaria
  get colorSecundario {
    // ?? indica que la propiedad por defecto o el valor por defecto será 1
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario( bool value ) {

    _prefs.setBool('colorSecundario', value);

  }

  // GETTERS Y SETERS del Nombre Usuario
  get nombreUsuario {
    // ?? indica que la propiedad por defecto o el valor por defecto será 1
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario( String value ) {

    _prefs.setString('nombreUsuario', value);

  }

  // GETTERS Y SETERS de la última página
  get ultimaPagina {
    // ?? indica que la propiedad por defecto o el valor por defecto será 1
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina( String value ) {

    _prefs.setString('ultimaPagina', value);

  }


}