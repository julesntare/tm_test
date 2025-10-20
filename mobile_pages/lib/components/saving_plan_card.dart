import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SavingPlanCard extends StatefulWidget {
  const SavingPlanCard({super.key});

  @override
  State<SavingPlanCard> createState() => _SavingPlanCardState();
}

class _SavingPlanCardState extends State<SavingPlanCard> {
  late PageController _pageController;
  int _currentPage = 0;

  // Multiple saving plan data
  final List<SavingPlanData> _savingPlans = [
    SavingPlanData(
      title: 'Emergency Fund',
      currentAmount: 250.00,
      targetAmount: 1000.00,
      icon: Icons.savings,
      color: WalletColors.success,
    ),
    SavingPlanData(
      title: 'Vacation Fund',
      currentAmount: 850.00,
      targetAmount: 2000.00,
      icon: Icons.beach_access,
      color: WalletColors.primary,
    ),
    SavingPlanData(
      title: 'Car Down Payment',
      currentAmount: 3200.00,
      targetAmount: 5000.00,
      icon: Icons.directions_car,
      color: WalletColors.secondary,
    ),
    SavingPlanData(
      title: 'Home Renovation',
      currentAmount: 5000.00,
      targetAmount: 15000.00,
      icon: Icons.home,
      color: WalletColors.accent,
    ),
    SavingPlanData(
      title: 'Retirement Fund',
      currentAmount: 15000.00,
      targetAmount: 100000.00,
      icon: Icons.pie_chart,
      color: WalletColors.warning,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.95);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Indicator dots
        SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicatorDots(),
          ),
        ),
        const SizedBox(height: 10),
        // Saving plans carousel with different transition - fade only
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _savingPlans.length,
            itemBuilder: (context, index) {
              // Fade-only transition effect (different from wallet cards)
              double currentPageValue = _pageController.hasClients
                  ? _pageController.page ?? 0
                  : 0;
              double position = (index - currentPageValue).abs();
              
              // Calculate opacity based on position (only fade, no sliding)
              double opacity = 1.0 - (position * 0.7).clamp(0.0, 0.7);

              return _buildSavingPlanCard(index, opacity);
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicatorDots() {
    return List.generate(
      _savingPlans.length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: _currentPage == index ? 12 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: _currentPage == index
              ? Theme.of(context).primaryColor
              : Colors.grey[300],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingPlanCard(int index, double opacity) {
    final plan = _savingPlans[index];
    double progress = plan.currentAmount / plan.targetAmount;
    String progressText = '\$${plan.currentAmount.toStringAsFixed(2)} of \$${plan.targetAmount.toStringAsFixed(2)}';

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        return Opacity(
          opacity: opacity,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          plan.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          progressText,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: Theme.of(context).textTheme.bodyMedium?.color),
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            plan.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: plan.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(plan.icon, color: plan.color),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SavingPlanData {
  final String title;
  final double currentAmount;
  final double targetAmount;
  final IconData icon;
  final Color color;

  SavingPlanData({
    required this.title,
    required this.currentAmount,
    required this.targetAmount,
    required this.icon,
    required this.color,
  });
}