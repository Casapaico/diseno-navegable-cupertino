import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show CircleAvatar;
import '../widgets/main_drawer.dart';

class ListarAlumnosScreen extends StatelessWidget {
  const ListarAlumnosScreen({super.key});

  static const List<Map<String, String>> _alumnos = [
    {'nombre': 'Ana García',    'grado': '3° Primaria'},
    {'nombre': 'Luis Torres',   'grado': '5° Primaria'},
    {'nombre': 'María López',   'grado': '1° Secundaria'},
    {'nombre': 'Carlos Ruiz',   'grado': '2° Secundaria'},
    {'nombre': 'Sofia Mendoza', 'grado': '4° Primaria'},
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Alumnos')),
      child: SafeArea(
        child: Row(children: [
          const MainDrawer(),
          Expanded(
            child: CupertinoListSection.insetGrouped(
              header: Text('Total: ${_alumnos.length} alumnos'),
              children: List.generate(_alumnos.length, (i) {
                final a = _alumnos[i];
                final iniciales = a['nombre']!
                    .split(' ').map((p) => p[0]).take(2).join();
                return CupertinoListTile(
                  leading: CircleAvatar(
                    backgroundColor: CupertinoColors.activeBlue,
                    child: Text(iniciales,
                        style: const TextStyle(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                  title: Text(a['nombre']!),
                  subtitle: Text(a['grado']!),
                  trailing: const CupertinoListTileChevron(),
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}
