import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onScanPressed;
  final VoidCallback onMenuPressed;
  final VoidCallback onStatsPressed;
  final int currentPage;

  const BottomNavigation({
    super.key,
    required this.onHomePressed,
    required this.onScanPressed,
    required this.onMenuPressed,
    required this.onStatsPressed,
    this.currentPage = 0,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Home Icon
          _buildNavItem(
            icon: Icons.home,
            onPressed: widget.onHomePressed,
            isActive: widget.currentPage == 0,
          ),
          // Scan Icon
          _buildNavItem(
            icon: Icons.document_scanner,
            onPressed: widget.onScanPressed,
            isActive: widget.currentPage == 1,
          ),
          // Stats Icon
          _buildNavItem(
            icon: Icons.bar_chart,
            onPressed: widget.onStatsPressed,
            isActive: widget.currentPage == 2,
          ),
          // Menu Icon
          _buildNavItem(
            icon: Icons.grid_3x3,
            onPressed: widget.onMenuPressed,
            isActive: widget.currentPage == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required VoidCallback onPressed, required bool isActive}) {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(
        icon, 
        size: 28, 
        color: isActive 
          ? Theme.of(context).primaryColor 
          : Theme.of(context).iconTheme.color,
      ),
      onPressed: onPressed,
    );
  }
}