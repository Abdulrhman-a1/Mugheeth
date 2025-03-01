import 'package:flutter/material.dart';
import 'package:graduation/common/helper/text.dart';
import 'package:graduation/features/history/ui/widgets/history_conten.dart';

class CardContainer extends StatelessWidget {
  final Map<String, String> event;
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const CardContainer({
    required this.event,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isFirst = index == 0;
    final isLast = index == event.length - 1;
    final categoryStyle = getCategoryStyle(event['category'] ?? 'Level1');
    final color = categoryStyle['color'] as Color;

    return Padding(
      padding: EdgeInsets.only(
        top: isFirst ? 8 : 12,
        bottom: isLast ? 8 : 12,
      ),
      child: Hero(
        tag: 'card',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              decoration: BoxDecoration(
                color: isExpanded
                    ? color.withOpacity(0.1)
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isExpanded
                      ? color.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isExpanded
                        ? color.withOpacity(0.2)
                        : Colors.black.withOpacity(0.05),
                    blurRadius: isExpanded ? 12 : 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: HistoryContent(
                event: event,
                isExpanded: isExpanded,
                categoryStyle: categoryStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
