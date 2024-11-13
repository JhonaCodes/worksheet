import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            _MobileCards(),
            _MobileCards(),
            _MobileCards(),
            _MobileCards(),
          ],
        )
      ],
    );
  }
}



class _MobileCards extends StatelessWidget {
  const _MobileCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Total Actividades"),
            Text("24"),
            InfoLabel(
              leftIcon: Icon(Icons.arrow_upward, color: Colors.green, size: 10,),
              text: "12% vs ayer",
              typeInfoLabel: TypeInfoLabel.warning,
            )
          ],
        ),
      ),
    );
  }
}
