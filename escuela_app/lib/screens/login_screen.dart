import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, '/perfil');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Iniciar Sesión')),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.building_2_fill,
                    size: 64, color: CupertinoColors.activeBlue),
                const SizedBox(height: 32),
                CupertinoTextFormFieldRow(
                  controller: _userCtrl,
                  placeholder: 'Usuario',
                  prefix: const Icon(CupertinoIcons.person),
                  validator: (v) => v!.isEmpty ? 'Ingresa tu usuario' : null,
                ),
                const SizedBox(height: 12),
                CupertinoTextFormFieldRow(
                  controller: _passCtrl,
                  placeholder: 'Contraseña',
                  obscureText: true,
                  prefix: const Icon(CupertinoIcons.lock),
                  validator: (v) => v!.isEmpty ? 'Ingresa tu contraseña' : null,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton.filled(
                    onPressed: _login,
                    child: const Text('Ingresar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
