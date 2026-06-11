import 'package:flutter/cupertino.dart';
import '../widgets/main_drawer.dart';

class RegistrarAlumnoScreen extends StatefulWidget {
  const RegistrarAlumnoScreen({super.key});
  @override
  State<RegistrarAlumnoScreen> createState() => _RegistrarAlumnoScreenState();
}

class _RegistrarAlumnoScreenState extends State<RegistrarAlumnoScreen> {
  final _formKey    = GlobalKey<FormState>();
  final _nombreCtrl  = TextEditingController();
  final _apellidoCtrl = TextEditingController();
  final _edadCtrl    = TextEditingController();
  final _emailCtrl   = TextEditingController();

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Éxito'),
          content: const Text('Alumno registrado correctamente.'),
          actions: [
            CupertinoDialogAction(
              child: const Text('Aceptar'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Registrar Alumno')),
      child: SafeArea(
        child: Row(children: [
          const MainDrawer(),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  CupertinoTextFormFieldRow(
                    controller: _nombreCtrl,
                    placeholder: 'Nombre',
                    prefix: const Icon(CupertinoIcons.person),
                    validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                  ),
                  CupertinoTextFormFieldRow(
                    controller: _apellidoCtrl,
                    placeholder: 'Apellido',
                    prefix: const Icon(CupertinoIcons.person_2),
                    validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                  ),
                  CupertinoTextFormFieldRow(
                    controller: _edadCtrl,
                    placeholder: 'Edad',
                    keyboardType: TextInputType.number,
                    prefix: const Icon(CupertinoIcons.number),
                    validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                  ),
                  CupertinoTextFormFieldRow(
                    controller: _emailCtrl,
                    placeholder: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    prefix: const Icon(CupertinoIcons.mail),
                    validator: (v) => v!.isEmpty ? 'Campo requerido' : null,
                  ),
                  const SizedBox(height: 24),
                  CupertinoButton.filled(
                    onPressed: _guardar,
                    child: const Text('Guardar'),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
