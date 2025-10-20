import 'package:flutter/material.dart';
import '../theme/colors.dart';

class StatisticsTabs extends StatelessWidget {
  final TabController tabController;
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const StatisticsTabs({
    super.key,
    required this.tabController,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TabBar(
        controller: tabController,
        labelColor: WalletColors.primary,
        unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
        indicator: BoxDecoration(
          color: WalletColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        tabs: const [
          Tab(text: 'Income'),
          Tab(text: 'Spending'),
        ],
      ),
    );
  }
}