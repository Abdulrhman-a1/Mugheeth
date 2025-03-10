import 'package:flutter/material.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/custom_shape/suggestion_container.dart';

/// List or row of suggestion shown above the text field in empty chat.
class ChatSuggestions extends StatefulWidget {
  final Function(String) onSuggestionSelected;

  const ChatSuggestions({
    super.key,
    required this.onSuggestionSelected,
  });

  @override
  State<ChatSuggestions> createState() => _ChatSuggestionsState();
}

class _ChatSuggestionsState extends State<ChatSuggestions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          AnimatedItem(
            index: 0,
            child: SuggestionContainer(
              title: 'الم في الصدر',
              description: 'اشعر بالم في اعلى الصدر مستمر لعدة ايام',
              img: 'assets/icons/chest-pain.png',
              onTap: () {
                widget.onSuggestionSelected(
                    'اشعر بالم في اعلى الصدر مستمر لعدة ايام');
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 1,
            child: SuggestionContainer(
              title: 'حرارة',
              description: 'حرارتي مرتفعة منذ الصباح',
              img: 'assets/icons/sneeze.png',
              onTap: () {
                widget.onSuggestionSelected('حرارتي مرتفعة منذ الصباح');
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 2,
            child: SuggestionContainer(
              title: 'صداع',
              description: 'الم في جانب الراس مستمر لفترات طويلة',
              img: 'assets/icons/headache.png',
              onTap: () {
                widget.onSuggestionSelected(
                    'الم في جانب الراس مستمر لفترات طويلة');
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 3,
            child: SuggestionContainer(
              title: 'احمرار العين',
              description: 'تغير لون العين الى الاحمرار',
              img: 'assets/icons/eye.png',
              onTap: () {
                widget.onSuggestionSelected('تغير لون العين الى الاحمرار');
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 3,
            child: SuggestionContainer(
              title: 'كحة مستمرة',
              description: 'اشعر بالكحة منذ الصباح',
              img: 'assets/icons/cough.png',
              onTap: () {
                widget.onSuggestionSelected('اشعر بالكحة منذ الصباح');
              },
            ),
          ),
        ],
      ),
    );
  }
}
