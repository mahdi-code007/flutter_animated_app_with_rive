import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animated_app_with_rive/screens/onbording/widgets/animated_btn.dart';
import 'package:flutter_animated_app_with_rive/screens/onbording/widgets/custom_sign_in_dialog.dart';
import 'package:flutter_animated_app_with_rive/screens/onbording/widgets/sign_in_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShown = false;
  late RiveAnimationController _btnAnimationController;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation('active', autoplay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned(
            bottom: 200.sp,
            left: 100.sp,
            width: 1.7.sw,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            height: 1.sh,
            width: 1.sw,
            top: isSignInDialogShown ? -60 : 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 230.w,
                      child: Column(
                        children: [
                          Text(
                            "Learn design \n& code",
                            style: TextStyle(
                              fontSize: 50.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          const Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedButton(
                      btnAnimationController: _btnAnimationController,
                      onPress: () {
                        _btnAnimationController.isActive = true;
                        Future.delayed(
                          const Duration(milliseconds: 800),
                              () {
                            setState(() {
                              isSignInDialogShown = true;
                            });
                            customSignInDialog(context, onDialogClose: (value) {
                              setState(() {
                                isSignInDialogShown = false;
                              });
                            });
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
