import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key, required btnAnimationController, required this.onPress})
      : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        height: 60.h,
        width: 230.w,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
              top: 7.sp,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_forward),
                  SizedBox(
                    width: 5.w,
                  ),
                  const Text(
                    'Start the course',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}