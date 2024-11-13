import 'package:flutter/material.dart';
import 'package:worksheet/src/common/ui/widget/text_field_value_widget.dart';

class UpdatePasswordView extends StatefulWidget {
  const UpdatePasswordView({super.key});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 200),
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.energy_savings_leaf_sharp,
                  size: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Cambiar contraseña",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Ingresa y confirma tu nueva contraseña para continuar",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),

                TextFieldValue(
                  hintText: "Confirmar contraseña",
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

                const TextFieldValue(
                  hintText: "Nueva contraseña",
                  maxLines: 1,
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                      WidgetStatePropertyAll<Color>(Colors.indigo)),
                  onPressed: () {},
                  child: const Text(
                    "Cambiar contraseña",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.indigo,
                      ),
                      label: const Text(
                        "Volver al inicio de sesión",
                        style: TextStyle(color: Colors.indigo),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
