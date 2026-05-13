import 'package:flutter/material.dart';

import '../core/config/app_theme.dart';
import '../core/navigation/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture + GraphQL Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.dashboard,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
