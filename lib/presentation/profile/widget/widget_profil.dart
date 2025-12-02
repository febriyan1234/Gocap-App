import 'package:flutter/material.dart';

class WidgetProfil extends StatelessWidget{
  final String icon;
  final String description;
  final Function() onTapItem;

  const WidgetProfil({
    super.key,
    required this.icon,
    required this.description,
    required this.onTapItem,

  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withAlpha(70)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(icon, height: 30, width: 30,),
            const SizedBox(height: 8),
            Text(
              textAlign: TextAlign.center,
              description,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

}