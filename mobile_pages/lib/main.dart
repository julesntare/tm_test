import 'package:flutter/material.dart';
import 'theme/colors.dart';
import 'theme/themes.dart';
import 'components/balance_card.dart';
import 'components/wallet_cards.dart';
import 'components/saving_plan_card.dart';
import 'components/transaction_item.dart';
import 'components/bottom_navigation.dart';

void main() {
  runApp(const EWaMaApp());
}

class EWaMaApp extends StatefulWidget {
  const EWaMaApp({super.key});

  @override
  State<EWaMaApp> createState() => _EWaMaAppState();
}

class _EWaMaAppState extends State<EWaMaApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-WaMa',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: WalletHomePage(themeToggle: _toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}

class WalletHomePage extends StatelessWidget {
  final VoidCallback themeToggle;
  final bool isDarkMode;

  const WalletHomePage({
    super.key, 
    required this.themeToggle, 
    required this.isDarkMode
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header section that stays fixed at the top
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 30, color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good morning',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'John Doe',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: themeToggle,
                  ),
                ],
              ),
            ),
            // Scrollable content
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  // Balance Section with wallet-themed gradient
                  const BalanceCard(),
                  const SizedBox(height: 24),

                  // Wallet Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'My Wallet',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 16, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              'New Card',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Credit Cards Section
                  const WalletCards(),
                  const SizedBox(height: 24),

                  // Saving Plan Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Saving Plan',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: WalletColors.success,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 16, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              'New',
                              style: TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Saving Plan Card
                  const SavingPlanCard(),
                  const SizedBox(height: 24),

                  // Transaction History Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaction History',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(onPressed: () {}, child: const Text('See More')),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Transaction List
                  TransactionItem(
                    icon: Icons.arrow_upward,
                    title: 'Grocery Store',
                    subtitle: 'Today, 09:45 AM',
                    amount: '-\$84.50',
                    isExpense: true,
                  ),
                  TransactionItem(
                    icon: Icons.arrow_downward,
                    title: 'Salary Deposit',
                    subtitle: 'Yesterday, 02:30 PM',
                    amount: '+\$2,450.00',
                    isExpense: false,
                  ),
                  TransactionItem(
                    icon: Icons.arrow_upward,
                    title: 'Gas Station',
                    subtitle: 'Oct 18, 11:20 AM',
                    amount: '-\$45.20',
                    isExpense: true,
                  ),
                  TransactionItem(
                    icon: Icons.arrow_upward,
                    title: 'Coffee Shop',
                    subtitle: 'Oct 17, 03:15 PM',
                    amount: '-\$5.75',
                    isExpense: true,
                  ),
                  TransactionItem(
                    icon: Icons.arrow_downward,
                    title: 'Freelance Work',
                    subtitle: 'Oct 16, 04:45 PM',
                    amount: '+\$350.00',
                    isExpense: false,
                  ),
                  const SizedBox(height: 80), // Add some bottom padding to account for bottom navigation
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: BottomNavigation(
          onHomePressed: () {
            // Handle home navigation
          },
          onScanPressed: () {
            // Handle scan action
          },
          onMenuPressed: () {
            // Handle menu action
          },
        ),
      ),
    );
  }
}
