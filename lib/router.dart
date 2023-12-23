import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/startup_screen.dart';
import 'package:quiz_app/screens/categories_screen.dart';
import 'package:quiz_app/screens/category_details_screen.dart';

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
            path: 'category_details',
            name: CategoryDetailsScreen.routeName,
            builder: (context, state) => const CategoryDetailsScreen(),
          )
        ]),
  ],
);
