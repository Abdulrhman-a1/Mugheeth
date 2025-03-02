import 'package:flutter/material.dart';
import 'package:graduation/features/history/ui/widgets/card_container.dart';

///List of cards, each card represent a medical history event. I'll will replace this when I get the real data.
class MedicalHistoryCards extends StatefulWidget {
  final List<Map<String, String>> medicalHistoryData;

  const MedicalHistoryCards({super.key, required this.medicalHistoryData});

  @override
  State<MedicalHistoryCards> createState() => _MedicalHistoryCardsState();
}

class _MedicalHistoryCardsState extends State<MedicalHistoryCards> {
  final ScrollController _scrollController = ScrollController();
  final List<bool> _expandedStates = [];

  @override
  void initState() {
    super.initState();
    _expandedStates.addAll(
        List.generate(widget.medicalHistoryData.length, (index) => false));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onMilestoneTap(int index) {
    setState(() {
      _expandedStates[index] = !_expandedStates[index];
    });

    if (_expandedStates[index]) {
      final itemPosition =
          (index * 160.0) - (_scrollController.position.viewportDimension / 3);
      _scrollController.animateTo(
        itemPosition.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.medicalHistoryData.length,
      itemBuilder: (context, index) {
        final event = widget.medicalHistoryData[index];
        return CardContainer(
          event: event,
          index: index,
          isExpanded: _expandedStates[index],
          onTap: () => _onMilestoneTap(index),
        );
      },
    );
  }
}
