import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../components/total_earnings_section.dart';
import '../components/bottom_navigation.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0; // 0 for Income, 1 for Spending
  late PageController _pageController;
  int _currentCategory = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _tabController.addListener(() {
      setState(() {
        _selectedTab = _tabController.index;
      });
    });

    // Start the animation after a small delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _fadeInAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeInAnimation.value,
                  child: SafeArea(
                    child: Stack(
                      children: [
                        // Subtle background with gradient
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(
                                  context,
                                ).primaryColor.withValues(alpha: 0.03),
                                Theme.of(
                                  context,
                                ).primaryColorDark.withValues(alpha: 0.03),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        // Main content
                        CustomScrollView(
                          slivers: [
                            // Header with title and actions
                            SliverToBoxAdapter(
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withValues(
                                                alpha: 0.1,
                                              ),
                                              blurRadius: 15,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.arrow_back_ios_new,
                                          color: Theme.of(context).primaryColor,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Statistics',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    PopupMenuButton<String>(
                                      icon: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withValues(
                                                alpha: 0.1,
                                              ),
                                              blurRadius: 15,
                                              offset: const Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.more_horiz,
                                          color: Theme.of(context).primaryColor,
                                          size: 24,
                                        ),
                                      ),
                                      onSelected: (String result) {},
                                      itemBuilder: (BuildContext context) => [
                                        const PopupMenuItem<String>(
                                          value: 'export',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.download,
                                                color: WalletColors.primary,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Export Data'),
                                            ],
                                          ),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'settings',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.settings,
                                                color: WalletColors.primary,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Settings'),
                                            ],
                                          ),
                                        ),
                                        const PopupMenuItem<String>(
                                          value: 'help',
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.help,
                                                color: WalletColors.primary,
                                              ),
                                              SizedBox(width: 10),
                                              Text('Help'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Tab selector section with modern styling
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[800]
                                      : Colors.grey[100],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TabBar(
                                  controller: _tabController,
                                  indicator: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Theme.of(context).cardColor,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withValues(
                                          alpha: 0.2,
                                        ),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  labelColor: Theme.of(context).primaryColor,
                                  unselectedLabelColor:
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.grey[500]
                                      : Colors.grey[600],
                                  tabs: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.arrow_upward, size: 16),
                                          SizedBox(width: 6),
                                          Text(
                                            'Income',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.arrow_downward, size: 16),
                                          SizedBox(width: 6),
                                          Text(
                                            'Spending',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Summary cards section with better spacing and design
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Summary',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        _buildAnimatedSummaryCard(
                                          'Total',
                                          '\$12,450.80',
                                          Theme.of(context).primaryColor,
                                          0,
                                          1.0,
                                        ),
                                        _buildAnimatedSummaryCard(
                                          'This Month',
                                          '\$3,240.50',
                                          Theme.of(context).primaryColor,
                                          1,
                                          1.1,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15),
                                    _buildAnimatedSummaryCard(
                                      'Avg. Daily',
                                      '\$125.40',
                                      Theme.of(context).colorScheme.secondary,
                                      2,
                                      1.2,
                                      width: double.infinity,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Total Earnings chart section
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withValues(
                                        alpha: 0.05,
                                      ),
                                      blurRadius: 20,
                                      offset: const Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total Earnings',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).primaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            'Last 6 months',
                                            style: TextStyle(
                                              color: Theme.of(
                                                context,
                                              ).primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 180,
                                      child: const TotalEarningsSection(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Payments section
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(
                                  20,
                                  25,
                                  20,
                                  10,
                                ),
                                child: Text(
                                  'Payments',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 1.3,
                                      ),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    final categories = [
                                      'Food & Dining',
                                      'Transport',
                                      'Shopping',
                                      'Entertainment',
                                    ];
                                    final values =
                                        ["2000", "1500", "3000", "1000"]
                                            .map(
                                              (e) => double.parse(
                                                e.replaceAll('\$', ''),
                                              ),
                                            )
                                            .toList();
                                    final colors = [
                                      Colors.red.shade400,
                                      Colors.blue.shade400,
                                      Colors.green.shade400,
                                      Colors.orange.shade400,
                                    ];

                                    return _buildPaymentCard(
                                      categories[index],
                                      values[index],
                                      colors[index],
                                      index == _currentCategory,
                                      index,
                                    );
                                  },
                                ),
                              ),
                            ),
                            // Add some bottom padding
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Bottom Navigation - Statistics icon active
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: BottomNavigation(
              currentPage: 2, // Stats page is index 2
              onHomePressed: () {
                Navigator.pop(context); // Go back to home
              },
              onScanPressed: () {
                // Do nothing or handle as needed
              },
              onStatsPressed: () {
                // Stay on this page (stats page)
              },
              onMenuPressed: () {
                Navigator.pop(context); // Go back to home
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedSummaryCard(
    String title,
    String amount,
    Color color,
    int delay,
    double scaleDelay, {
    double width = 150,
  }) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final animationValue = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              delay * 0.15,
              (delay * 0.15) + 0.3,
              curve: Curves.easeOutCubic,
            ),
          ),
        );

        return Transform.scale(
          scale: animationValue.value,
          child: Opacity(
            opacity: animationValue.value,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.08),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]
                            : Colors.grey[600],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      amount,
                      style: TextStyle(
                        color: color,
                        fontSize: width == double.infinity ? 22 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentCard(
    String category,
    double percentage,
    Color color,
    bool isSelected,
    int index,
  ) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final animationValue = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Interval(
              0.4 + (index * 0.1),
              0.5 + (index * 0.1),
              curve: Curves.easeOut,
            ),
          ),
        );

        return Transform.scale(
          scale: animationValue.value,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
              border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).brightness == Brightness.dark
                    ? Colors.transparent
                    : Colors.transparent,
                width: isSelected ? 2.0 : 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          category == 'Food & Dining'
                              ? Icons.restaurant
                              : category == 'Transport'
                              ? Icons.directions_car
                              : category == 'Shopping'
                              ? Icons.shopping_bag
                              : Icons.movie,
                          color: color,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$${percentage.toStringAsFixed(1)}',
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: percentage / 100,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[700]
                        : Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                    minHeight: 6,
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
