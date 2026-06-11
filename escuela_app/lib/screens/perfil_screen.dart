import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar;
import '../widgets/main_drawer.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  Widget _fila(IconData icon, String label, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(children: [
        Icon(icon, color: CupertinoColors.activeBlue),
        const SizedBox(width: 12),
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(valor),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Mi Perfil')),
      child: SafeArea(
        child: Row(children: [
          const MainDrawer(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: CupertinoColors.activeBlue,
                    child: Icon(CupertinoIcons.person_fill,
                        size: 48, color: CupertinoColors.white),
                  ),
                ),
                const SizedBox(height: 24),
                _fila(CupertinoIcons.person, 'Nombre', 'Juan Pérez'),
                _fila(CupertinoIcons.mail, 'Email', 'juan@escuela.edu'),
                _fila(CupertinoIcons.phone, 'Teléfono', '+51 987 654 321'),
                _fila(CupertinoIcons.building_2_fill, 'Rol', 'Administrador'),
                const SizedBox(height: 32),
                CupertinoButton(
                  color: CupertinoColors.destructiveRed,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  child: const Text('Cerrar sesión'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
