import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/categories_screen.dart';

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
            const Text('Welcome'),
            const Spacer(),
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
          ],
        ),
      ),
    );
  }
}
