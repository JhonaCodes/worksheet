import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';
import 'package:worksheet/src/common/ui/widget/text_field_value_widget.dart';

class PasswordRecoveryView extends StatelessWidget {
  const PasswordRecoveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 500,
        minWidth: 200,
      ),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.energy_savings_leaf_sharp,
                  size: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Recuperar contraseña",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "Ingresa tu correo electrónico y te enviaremos las instrucciones para recuperar tu contraseña",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldValue(
                  hintText: "Correo electrónico",
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text(
                    "Enviar instrucciones",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(Colors.indigo)),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    title: Text("Recibirás un correo con:"),
                    subtitle: Column(
                      children: [
                        _RowDotAndText(
                          label: "Link para restablecer tu contraseña",
                        ),
                        _RowDotAndText(
                          label: "Instrucciones detalladas",
                        ),
                        _RowDotAndText(
                          label: "Contacto de soporte si lo necesitas",
                        ),
                      ],
                    ),
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.indigo,
                      ),
                      label: Text(
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

class _RowDotAndText extends StatelessWidget {
  final String label;

  const _RowDotAndText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.circle,
          size: 5,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
