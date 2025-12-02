import 'package:flutter/material.dart';

class ShortcutCard extends StatelessWidget{
  final String title;
  final IconData icon;
  final Color bgColor;

  const ShortcutCard({
    super.key, 
    required this.title,
    required this.icon,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: bgColor.withAlpha(64),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                ),
              ),
              Icon(icon, color: Colors.green, size: 26),
            ],
          ),
        ],
      ),
    );
  }
}

