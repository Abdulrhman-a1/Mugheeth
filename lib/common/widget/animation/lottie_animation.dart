// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class LottieAnimation extends StatefulWidget {
//   final String assetPath;
//   final double width;
//   final double height;

//   const LottieAnimation({
//     super.key,
//     required this.assetPath,
//     required this.width,
//     required this.height,
//   });

//   @override
//   LottieAnimationState createState() => LottieAnimationState();
// }

// class LottieAnimationState extends State<LottieAnimation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       duration: const Duration(seconds: 4),
//       vsync: this,
//     )..repeat(reverse: false);

//     _animation = Tween<Offset>(
//       begin: const Offset(-1, 1),
//       end: const Offset(1, -1),
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.easeInOut,
//     ));
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(
//             _animation.value.dx * MediaQuery.of(context).size.width,
//             _animation.value.dy * MediaQuery.of(context).size.height,
//           ),
//           child: Opacity(
//             opacity: _controller.value <= 0.8 ? 1 : 0,
//             child: Lottie.asset(
//               widget.assetPath,
//               width: widget.width,
//               height: widget.height,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
