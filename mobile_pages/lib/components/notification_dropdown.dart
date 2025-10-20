import 'package:flutter/material.dart';

class NotificationDropdown extends StatefulWidget {
  const NotificationDropdown({super.key});

  @override
  State<NotificationDropdown> createState() => _NotificationDropdownState();
}

class _NotificationDropdownState extends State<NotificationDropdown> {
  final bool _hasNotifications = true; // This would typically come from a data source
  final int _notificationCount = 3; // This would typically come from a data source

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            _hasNotifications ? Icons.notifications_active : Icons.notifications_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            // Show notification dropdown/popup
            _showNotificationDropdown(context);
          },
        ),
        if (_hasNotifications)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$_notificationCount',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }

  void _showNotificationDropdown(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: [
        _buildNotificationItem(
          icon: Icons.payment,
          title: 'Payment Received',
          subtitle: 'You received \$250 from John',
          time: '2 min ago',
        ),
        _buildNotificationItem(
          icon: Icons.account_balance_wallet,
          title: 'Wallet Updated',
          subtitle: 'Your wallet balance has increased',
          time: '1 hour ago',
        ),
        _buildNotificationItem(
          icon: Icons.security,
          title: 'Security Alert',
          subtitle: 'New login from different device',
          time: '3 hours ago',
        ),
      ],
    );
  }

  PopupMenuItem _buildNotificationItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return PopupMenuItem(
      height: 80,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            time,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}