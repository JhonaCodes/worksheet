import 'package:flutter/material.dart';
import 'package:worksheet/src/common/ui/widget/text_field_value_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.energy_savings_leaf_sharp, size: 100,),
                SizedBox(height: 10,),
                Text(
                  "Bienvenido a Bitácora Digital",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Inicia sesión para continuar",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldValue(
                  hintText: "Correo electrónico",
                  maxLines: 1,
                ),
                TextFieldValue(
                  hintText: "Contraseña",
                  maxLines: 1,
                  obscureText: _isPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () => setState(
                        () => _isPasswordVisible = !_isPasswordVisible),
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10,),

                ElevatedButton(
                  child: Text("Inciiar Sesíon", style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.indigo)
                  ),
                  onPressed: (){},
                ),

                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("¿No tienes una cuenta?"),

                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Regístrate aquí",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
