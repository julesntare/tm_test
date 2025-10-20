import 'package:flutter/material.dart';

class StatisticsHeader extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onMenu;

  const StatisticsHeader({
    super.key,
    required this.onBack,
    required this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Back button
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
            onPressed: onBack,
          ),
          const Spacer(),
          // Title
          Text(
            'Statistics',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // Menu button
          IconButton(icon: const Icon(Icons.more_vert), onPressed: onMenu),
        ],
      ),
    );
  }
}
