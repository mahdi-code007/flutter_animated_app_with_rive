import 'package:flutter/material.dart';
import 'package:flutter_animated_app_with_rive/screens/onbording/widgets/sign_in_form.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Future<Object?> customSignInDialog(BuildContext context , {required ValueChanged onDialogClose}) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Sign In',
    transitionDuration: const Duration(milliseconds: 400),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(begin: const Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => Center(
      child: Container(
        height: .88.sh,
        margin: EdgeInsets.symmetric(horizontal: 16.r),
        padding: EdgeInsets.symmetric(vertical: 32.r, horizontal: 24.r),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.all(Radius.circular(40.r))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 34.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: const Text(
                      "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignInForm(),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.r),
                        child: const Text('OR'),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.r),
                    child: const Text(
                      'Sign up with Email, Apple or Google',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/email_box.svg',
                          height: 64.sp,
                          width: 64.sp,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/apple_box.svg',
                          height: 64.sp,
                          width: 64.sp,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/google_box.svg',
                          height: 64.sp,
                          width: 64.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: -0.065.sh,
                child: CircleAvatar(
                  radius: 16.r,
                  backgroundColor: Colors.white,
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  ).then(onDialogClose);
}