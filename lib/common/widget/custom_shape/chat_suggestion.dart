import 'package:flutter/material.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/widget/custom_shape/suggestion_container.dart';

/// List or row of suggestions shown above the text field in an empty chat.
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
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 10),
          AnimatedItem(
            index: 1,
            child: SuggestionContainer(
              title: loc.fever_title,
              description: loc.fever_description,
              img: 'assets/icons/sneeze.png',
              onTap: () {
                widget.onSuggestionSelected(loc.fever_description);
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 2,
            child: SuggestionContainer(
              title: loc.headache_title,
              description: loc.headache_description,
              img: 'assets/icons/headache.png',
              onTap: () {
                widget.onSuggestionSelected(loc.headache_description);
              },
            ),
          ),
          AnimatedItem(
            index: 0,
            child: SuggestionContainer(
              title: loc.chest_pain_title,
              description: loc.chest_pain_description,
              img: 'assets/icons/chest-pain1.png',
              onTap: () {
                widget.onSuggestionSelected(loc.chest_pain_description);
              },
            ),
          ),
          const SizedBox(width: 10),
          AnimatedItem(
            index: 4,
            child: SuggestionContainer(
              title: loc.persistent_cough_title,
              description: loc.persistent_cough_description,
              img: 'assets/icons/cough.png',
              onTap: () {
                widget.onSuggestionSelected(loc.persistent_cough_description);
              },
            ),
          ),
          AnimatedItem(
            index: 3,
            child: SuggestionContainer(
              title: loc.eye_redness_title,
              description: loc.eye_redness_description,
              img: 'assets/icons/eye.png',
              onTap: () {
                widget.onSuggestionSelected(loc.eye_redness_description);
              },
            ),
          ),
        ],
      ),
    );
  }
}
