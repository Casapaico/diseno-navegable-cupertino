import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show DefaultMaterialLocalizations, DefaultWidgetsLocalizations;
import 'screens/login_screen.dart';
import 'screens/perfil_screen.dart';
import 'screens/registrar_alumno_screen.dart';
import 'screens/listar_alumnos_screen.dart';
import 'screens/faq_screen.dart';

void main() => runApp(const EscuelaApp());

class EscuelaApp extends StatelessWidget {
  const EscuelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Escuela App',
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
        brightness: Brightness.light,
      ),
      initialRoute: '/login',
      routes: {
        '/':          (_) => const LoginScreen(),
        '/login':     (_) => const LoginScreen(),
        '/perfil':    (_) => const PerfilScreen(),
        '/registrar': (_) => const RegistrarAlumnoScreen(),
        '/alumnos':   (_) => const ListarAlumnosScreen(),
        '/faq':       (_) => const FaqScreen(),
      },
    );
  }
}
