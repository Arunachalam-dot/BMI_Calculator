import 'package:flutter/material.dart';

class SectionButton extends StatelessWidget {
  final VoidCallback onPress;
  final IconData icon;
  const SectionButton({super.key, required this.onPress, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //color: Theme.of(context).colorScheme.primary,
          color: Colors.purple,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Icon(
          icon,
          color: Theme.of(context).colorScheme.primaryContainer,
          //color: Colors.yellow,
          size: 25,
        ),
      ),
    );
  }
}
