import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(color: Colors.black54),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.r),
                      child: SvgPicture.asset('assets/icons/email.svg'),
                    )),
              ),
            ),
            const Text(
              'Password',
              style: TextStyle(color: Colors.black54),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.r, bottom: 16.r),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.r),
                      child: SvgPicture.asset('assets/icons/password.svg'),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.r , bottom: 24.r),
              child: ElevatedButton.icon(onPressed: (){},style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: const Color(0xFFF77D8E),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(25.r),
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r),
                      )
                  )
              ), icon: const Icon(Icons.arrow_forward), label: const Text('Sign In')),
            )
          ],
        ));
  }
}