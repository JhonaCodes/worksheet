import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 10,
          title: Icon(Icons.cloud_off),

          actions: [

            InfoLabel(
              text: "2 actividades sin sincronizar",
              contrastLevel: 0.1,
              typeInfoLabel: TypeInfoLabel.warning,
            ),
            SizedBox(
              width: 5.0,
            ),
            Icon(Icons.sync),
            SizedBox(
              width: 10,
            )
          ],
        ),
        drawer: Drawer(),
        body: child,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: Icon(Icons.add,color: Colors.white,),
          onPressed: () {},
        ),
      ),
    );
  }
}
