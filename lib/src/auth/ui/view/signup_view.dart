import 'package:flutter/material.dart';
import 'package:multiselect_field/core/multi_select.dart';
import 'package:worksheet/src/common/ui/widget/text_field_value_widget.dart';
import 'package:worksheet/src/common/utils/global.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500,
        minWidth: 200,
      ),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Icon(
                    Icons.energy_savings_leaf_sharp,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Crear nueva cuenta",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  Text(
                    "Completa tus datos para registrarte",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextFieldValue(
                    hintText: "Nombre",
                    maxLines: 1,
                  ),
                  const TextFieldValue(
                    hintText: "Apellido",
                    maxLines: 1,
                  ),
                  const TextFieldValue(
                    hintText: "Correo electrónico",
                    maxLines: 1,
                  ),
                  const TextFieldValue(
                    hintText: "Empresa",
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  MultiSelectField<String>(
                    data: () => jobRoles,
                    singleSelection: true,
                    label: "Cargo",
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black45)),
                    onSelect: (selected, def) {},
                  ),
                  TextFieldValue(
                    hintText: "Contraseña",
                    maxLines: 1,
                    obscureText: _isPasswordHidden,
                    suffixIcon: IconButton(
                      onPressed: () => setState(
                          () => _isPasswordHidden = !_isPasswordHidden),
                      icon: Icon(
                        _isPasswordHidden
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      ),
                    ),
                  ),
                  TextFieldValue(
                    hintText: "Confirmar contraseña",
                    maxLines: 1,
                    obscureText: _isPasswordHidden,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll<Color>(Colors.indigo)),
                    onPressed: () {},
                    child: const Text(
                      "Crear cuenta",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("¿Ya tienes una cuenta?"),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Inicia sesión",
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
      ),
    );
  }
}
