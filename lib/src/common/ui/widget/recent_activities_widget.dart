import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

class RecentActivitiesWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final TypeInfoLabel typeLabel;
  final String textStatus;
  const RecentActivitiesWidget({super.key, required this.typeLabel, required this.title, required this.subtitle, required this.textStatus});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Title(
        color: Colors.black,
        child: Text(title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      subtitle: Text(subtitle),
      trailing: InfoLabel(
        text: textStatus,
        typeInfoLabel: typeLabel,
        contrastLevel: 0.09,
      ),
    );
  }
}
