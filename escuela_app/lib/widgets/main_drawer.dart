import 'package:flutter/cupertino.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: CupertinoColors.systemGrey6,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Menú',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            _item(context, CupertinoIcons.person, 'Perfil', '/perfil'),
            _item(context, CupertinoIcons.person_add, 'Registrar Alumno', '/registrar'),
            _item(context, CupertinoIcons.list_bullet, 'Listar Alumnos', '/alumnos'),
            _item(context, CupertinoIcons.question_circle, 'FAQ', '/faq'),
            const Spacer(),
            _item(context, CupertinoIcons.square_arrow_left, 'Cerrar sesión', '/login',
                color: CupertinoColors.destructiveRed),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, IconData icon, String label, String ruta,
      {Color color = CupertinoColors.activeBlue}) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, ruta),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: color, fontSize: 15)),
        ]),
      ),
    );
  }
}
