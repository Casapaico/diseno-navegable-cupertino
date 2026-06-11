import 'package:flutter/cupertino.dart';
import '../widgets/main_drawer.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static const List<Map<String, String>> _faqs = [
    {
      'pregunta': '¿Cómo registro un nuevo alumno?',
      'respuesta': 'Ve al menú lateral y selecciona "Registrar Alumno". Completa todos los campos y presiona Guardar.',
    },
    {
      'pregunta': '¿Cómo consulto la lista de alumnos?',
      'respuesta': 'Desde el menú lateral selecciona "Listar Alumnos" para ver todos los alumnos registrados.',
    },
    {
      'pregunta': '¿Cómo cambio mi contraseña?',
      'respuesta': 'Ingresa a tu perfil y selecciona la opción "Cambiar contraseña" en configuración.',
    },
    {
      'pregunta': '¿Puedo usar la app sin internet?',
      'respuesta': 'Algunas funciones están disponibles offline, pero para sincronizar datos necesitas conexión.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text('Preguntas Frecuentes')),
      child: SafeArea(
        child: Row(children: [
          const MainDrawer(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _faqs.length,
              itemBuilder: (_, i) => _FaqItem(
                pregunta: _faqs[i]['pregunta']!,
                respuesta: _faqs[i]['respuesta']!,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String pregunta;
  final String respuesta;
  const _FaqItem({required this.pregunta, required this.respuesta});

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem> {
  bool _abierto = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() => _abierto = !_abierto),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(children: [
                const Icon(CupertinoIcons.question_circle,
                    color: CupertinoColors.activeBlue),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(widget.pregunta,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
                Icon(
                  _abierto
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  color: CupertinoColors.systemGrey,
                  size: 16,
                ),
              ]),
            ),
          ),
          if (_abierto)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
              child: Text(widget.respuesta,
                  style: const TextStyle(
                      color: CupertinoColors.secondaryLabel,
                      fontSize: 14)),
            ),
        ],
      ),
    );
  }
}
