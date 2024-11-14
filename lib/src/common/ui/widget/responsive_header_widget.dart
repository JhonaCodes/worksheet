import 'package:flutter/material.dart';

class ResponsiveDashboardHeader extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final double runSpacing;
  final int maxItemsPerRow;

  const ResponsiveDashboardHeader({
    super.key,
    required this.children,
    this.spacing = 8,
    this.runSpacing = 8,
    this.maxItemsPerRow = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double availableWidth = constraints.maxWidth;
        final int itemCount = children.length;
        const double minItemWidth = 170; // Ajusta este valor según tus necesidades

        int itemsPerRow = (availableWidth / (minItemWidth + spacing)).floor();
        itemsPerRow = itemsPerRow.clamp(1, maxItemsPerRow);

        int rows = (itemCount / itemsPerRow).ceil();
        double itemWidth = (availableWidth - (spacing * (itemsPerRow - 1))) / itemsPerRow;

        return Column(
          children: List.generate(rows, (rowIndex) {

            int startIndex = rowIndex * itemsPerRow;
            int endIndex = (startIndex + itemsPerRow).clamp(0, itemCount);

            return Padding(
              padding: EdgeInsets.only(bottom: rowIndex < rows - 1 ? runSpacing : 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: children.sublist(startIndex, endIndex).map((child) => SizedBox(
                  width: itemWidth,
                  child: child,
                )).toList(),
              ),
            );
          }),
        );
      },
    );
  }
}