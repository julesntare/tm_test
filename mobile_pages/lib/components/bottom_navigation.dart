import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onScanPressed;
  final VoidCallback onMenuPressed;

  const BottomNavigation({
    super.key,
    required this.onHomePressed,
    required this.onScanPressed,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -2), // Shadow only at the top
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Icon
          IconButton(
            icon: Icon(Icons.home, size: 30, color: Theme.of(context).iconTheme.color),
            onPressed: onHomePressed,
          ),
          // Scan Icon
          IconButton(
            icon: Icon(Icons.document_scanner, size: 30, color: Theme.of(context).iconTheme.color),
            onPressed: onScanPressed,
          ),
          // Menu Icon
          IconButton(
            icon: Icon(Icons.grid_3x3, size: 30, color: Theme.of(context).iconTheme.color),
            onPressed: onMenuPressed,
          ),
        ],
      ),
    );
  }
}