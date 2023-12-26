import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/category_full.dart';

import '../screens/startup_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/category_details_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: StartUpScreen.routeName,
      builder: (context, state) => const StartUpScreen(),
    ),
    GoRoute(
      path: '/categories',
      name: CategoriesScreen.routeName,
      builder: (context, state) => const CategoriesScreen(),
      routes: [
        GoRoute(
          path: 'category_details/:categoryTitle',
          name: CategoryDetailsScreen.routeName,
          builder: (context, state) {
            final title = state.pathParameters['categoryTitle'] as String;
            return CategoryDetailsScreen(title: title);
          },
          routes: [
            GoRoute(
              path: 'category_full',
              name: CategoryFullScreen.routeName,
              builder: (context, state) {
                final url = state.extra;
                return  CategoryFullScreen(imageUrl: url.toString(),);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
