import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/categories_screen.dart';

class StartUpScreen extends StatelessWidget {
  static const String routeName = 'StartUp';
  const StartUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            //* Header Welcome Animation and Text
            SizedBox(
              width: 200,
              height: 80,
              child: Lottie.asset('assets/animations/welcome_animation.json'),
            ),
            const Text(' to the Explore Islam Quiz: Let\'s Discover Together!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const Spacer(),

            // *Start Quiz Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                backgroundColor: style.colorScheme.primary,
                foregroundColor: style.colorScheme.onPrimary,
              ),
              onPressed: () {
                context.goNamed(CategoriesScreen.routeName);
              },
              label: const Text('Start Quiz'),
              icon: const Icon(Icons.arrow_forward),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
