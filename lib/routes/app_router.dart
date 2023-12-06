import 'package:auto_route/auto_route.dart';
import 'package:base_clean_bloc/features/example/presentation/pages/example_page.dart';
import 'package:base_clean_bloc/features/example/presentation/pages/login_screen.dart';
import 'package:base_clean_bloc/features/home/presentation/pages/home_screen.dart';
import 'package:base_clean_bloc/routes/app_routes.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@singleton
@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: AppRoutes.login,),
        AutoRoute(page: HomeRoute.page, path: AppRoutes.home, initial: true),
      ];
}
