import 'package:flutter/material.dart';

class ProfileInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool showEditIcon;
  final VoidCallback? onEditPressed;
  final Color iconColor;

  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.showEditIcon = false,
    this.onEditPressed,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value.isEmpty ? '-' : value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        if (showEditIcon)
          IconButton(
            onPressed: onEditPressed,
            icon: const Icon(Icons.edit, size: 20, color: Colors.deepPurple),
          ),
      ],
    );
  }
}