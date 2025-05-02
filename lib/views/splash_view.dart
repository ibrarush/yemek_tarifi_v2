import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_view.dart';
import '../widgets/get_started_button.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            SvgPicture.asset(
              'assets/app_title.svg',
              width: 200,
              height: 120,
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/splashv2.png',
              width: 300,
              height: 500,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GetStartedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 