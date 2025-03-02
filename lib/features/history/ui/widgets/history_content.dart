import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/features/history/ui/widgets/button_in_card.dart';
import 'package:iconsax/iconsax.dart';

///in this we structue the history content, and get the color based on triage levle.
class HistoryContent extends StatelessWidget {
  final Map<String, String> event;
  final bool isExpanded;
  final Map<String, dynamic> categoryStyle;

  const HistoryContent({
    required this.event,
    required this.isExpanded,
    required this.categoryStyle,
  });

  @override
  Widget build(BuildContext context) {
    final color = categoryStyle['color'] as Color;
    final text = categoryStyle['text'] as String;

    return Padding(
      padding: const EdgeInsets.all(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Iconsax.folder,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  event['date'] ?? 'No Date',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isExpanded
                        ? color
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: color.withOpacity(0.5),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            event['status'] ?? 'No Status',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Divider(
                  color: AppColors.chatScreenGrey,
                ),
                const SizedBox(height: 16),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text("التشخيص: ${event['diagnosis'] ?? 'غير محدد'}"),
                const SizedBox(height: 8),
                Text("الوصف: ${event['details'] ?? 'غير محدد'}"),
                const SizedBox(height: 8),
                Text("التوصية: ${event['recommendation'] ?? 'غير محدد'}"),
                const SizedBox(height: 16),
                CardButton(buttonColor: color),
              ],
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.easeInOutCubic,
          ),
        ],
      ),
    );
  }
}
