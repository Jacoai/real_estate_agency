import 'package:go_router/go_router.dart';
import 'package:real_estate_agency/core/navigation/root_screen.dart';
import 'package:real_estate_agency/feature/landlords/presentation/landlord_page_view.dart';
import 'package:real_estate_agency/feature/real_estate/presentation/real_estate_page_view.dart';
import 'package:real_estate_agency/feature/tenant/presentation/tenant_page_view.dart';

final router = GoRouter(
  initialLocation: '/landlords',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/landlords',
              builder: (context, state) {
                return LandlordPageView();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tanant',
              builder: (context, state) {
                return TenantPageView();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/real_estate',
              builder: (context, state) {
                return RealEstatePageView();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
