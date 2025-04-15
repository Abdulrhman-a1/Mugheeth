import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation/common/widget/pop_up/record_popUp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSend;
  final bool enabled;
  final String? hintText;

  const ChatInputField({
    super.key,
    required this.onSend,
    this.enabled = true,
    this.hintText,
  });

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();

  void sendUserMessage() {
    if (_controller.text.isNotEmpty && widget.enabled) {
      widget.onSend(_controller.text);
      _controller.clear();
    }
  }

  Future<void> handleVoiceRecording() async {
    if (widget.enabled) {
      final recognizedText = await showRecordingScreen(context);
      if (recognizedText != null && recognizedText.isNotEmpty) {
        setState(() {
          if (_controller.text.isNotEmpty) {
            _controller.text += ' $recognizedText';
          } else {
            _controller.text = recognizedText;
          }

          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.w),
      decoration: BoxDecoration(
        color: widget.enabled ? Colors.white : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              enabled: widget.enabled,
              decoration: InputDecoration(
                hintText: widget.hintText ?? loc.hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                if (widget.enabled) {
                  sendUserMessage();
                }
              },
            ),
          ),
          const SizedBox(width: 8),
          Opacity(
            opacity: widget.enabled ? 1.0 : 0.5,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Hero(
                tag: 'microphoneHero',
                child: Image.asset(
                  'assets/icons/microphone.png',
                  width: 24.sp,
                  height: 24.sp,
                ),
              ),
              onPressed: widget.enabled ? handleVoiceRecording : null,
            ),
          ),
          Opacity(
            opacity: widget.enabled ? 1.0 : 0.5,
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Transform.rotate(
                angle: loc.localeName == 'ar' ? 0 : 180 * 3.14 / 180,
                child: SvgPicture.asset(
                  'assets/icons/send.svg',
                  width: 24.sp,
                  height: 24.sp,
                  color: widget.enabled ? null : Colors.grey.shade400,
                ),
              ),
              onPressed: widget.enabled ? sendUserMessage : null,
            ),
          ),
        ],
      ),
    );
  }
}
