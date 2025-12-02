import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;
  final String imageUrl; 

  const AccountTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 28,
        height: 28,
        fit: BoxFit.contain,
      ),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}