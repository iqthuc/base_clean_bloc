import 'package:auto_route/auto_route.dart';
import 'package:base_clean_bloc/routes/app_router.gr.dart';
import 'package:base_clean_bloc/routes/app_routes.dart';
import 'package:injectable/injectable.dart';


@singleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
 @override
 List<AutoRoute> get routes => [
   AutoRoute(
          page: LoginRoute.page,
          path: AppRoutes.login,
          initial: true,
        ),
 ];
}