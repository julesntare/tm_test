import 'package:flutter/material.dart';
import '../theme/colors.dart';

class TotalEarningsSection extends StatelessWidget {
  const TotalEarningsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data for chart
    List<double> values = [3000, 4500, 2800, 5200, 4800, 6200];
    List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];

    // Find max value for scaling
    double maxValue = values.reduce((a, b) => a > b ? a : b);
    // Round up to nearest thousand for better axis scaling
    maxValue = (maxValue / 1000).ceil() * 1000;

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate relative chart dimensions based on available space
        final chartHeight = 80.0; // Fixed small height to ensure no overflow
        final chartWidth = constraints.maxWidth;

        return Container(
          padding: const EdgeInsets.all(10), // Minimal padding
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [WalletColors.primary, WalletColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Earnings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '\$12,450.80',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Compact chart with axis labels
              SizedBox(
                height: chartHeight,
                width: chartWidth,
                child: Row(
                  children: [
                    // Y-axis with values
                    SizedBox(
                      width: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${(maxValue ~/ 1000)}k',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 8,
                            ),
                          ),
                          Text(
                            '\$${(maxValue ~/ 2000)}k',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 8,
                            ),
                          ),
                          Text(
                            '\$0',
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.7),
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Chart area
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ), // Small gap for y-axis
                        child: Row(
                          children: List.generate(6, (index) {
                            double value = values[index];
                            double barHeight =
                                (value / maxValue) *
                                (chartHeight - 20); // Account for label space

                            return Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Bar
                                  Container(
                                    height: barHeight,
                                    width: 6, // Very narrow bars
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(2),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 3), // Small gap
                                  // Month label
                                  Text(
                                    months[index][0], // Use first letter to save space
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
