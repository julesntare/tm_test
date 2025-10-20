import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WalletCards extends StatefulWidget {
  const WalletCards({super.key});

  @override
  State<WalletCards> createState() => _WalletCardsState();
}

class _WalletCardsState extends State<WalletCards>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  late AnimationController _animationController;

  // Sample card data
  final List<CardData> _cards = [
    CardData(
      number: '**** 4832',
      holder: 'John Doe',
      bank: 'VISA',
      expiry: '08/26',
      colorStart: WalletColors.primary,
      colorEnd: WalletColors.primaryDark,
    ),
    CardData(
      number: '**** 5678',
      holder: 'John Doe',
      bank: 'MASTERCARD',
      expiry: '12/25',
      colorStart: WalletColors.secondary,
      colorEnd: Color(0xFF0D47A1),
    ),
    CardData(
      number: '**** 9012',
      holder: 'John Doe',
      bank: 'AMEX',
      expiry: '05/27',
      colorStart: WalletColors.accent,
      colorEnd: Color(0xFFFF5722),
    ),
    CardData(
      number: '**** 3456',
      holder: 'John Doe',
      bank: 'DISCOVER',
      expiry: '10/24',
      colorStart: Color(0xFF6A1B9A),
      colorEnd: Color(0xFF4A148C),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
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
        SizedBox(height: 10),
        // Card carousel with overlapping effect
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
              _animationController.forward().then((_) {
                _animationController.reverse();
              });
            },
            itemCount: _cards.length,
            itemBuilder: (context, index) {
              // Calculate the position relative to the current page for the wrapping effect
              double currentPageValue = _pageController.hasClients
                  ? _pageController.page ?? 0
                  : 0;
              double position = (index - currentPageValue).abs();

              // Calculate how much to offset based on position
              double normalizedPosition =
                  (position - position.truncateToDouble()).abs();
              double scale = 1.0 - (position * 0.1);
              double offset = (position <= 1.0)
                  ? (1 - normalizedPosition) * 30
                  : 30;

              // For cards that go behind, we'll add a rotation effect
              double rotation = (index - currentPageValue) * 0.05;

              return _buildCard(index, offset, scale, rotation);
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildIndicatorDots() {
    return List.generate(
      _cards.length,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
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
              offset: Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(int index, double offset, double scale, double rotation) {
    final card = _cards[index];

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..translate(offset * (index > _currentPage ? -1 : 1), 0.0)
            ..scale(scale)
            ..rotateZ(rotation),
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [card.colorStart, card.colorEnd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.4),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Card design elements
                Positioned(
                  top: 20,
                  right: 20,
                  child: Opacity(
                    opacity: 0.2,
                    child: Icon(
                      Icons.account_balance,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            card.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              card.bank,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card Holder',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                card.holder,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Expires',
                                style: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                card.expiry,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Chip design
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.payment, color: Colors.white, size: 24),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardData {
  final String number;
  final String holder;
  final String bank;
  final String expiry;
  final Color colorStart;
  final Color colorEnd;

  CardData({
    required this.number,
    required this.holder,
    required this.bank,
    required this.expiry,
    required this.colorStart,
    required this.colorEnd,
  });
}
