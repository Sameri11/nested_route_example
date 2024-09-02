import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'main.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'My App',
    );
  }
}

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        title: const Text('My App'),
      ),
      endDrawer: const MenuDrawer(),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              AutoRouter.of(context).pushNamed('/');
              // to close drawer
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              AutoRouter.of(context).pushNamed('/about');
              // to close drawer
              Navigator.of(context).pop();
            },
          ),
          // Other drawer items...
        ],
      ),
    );
  }
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: RootRoute.page,
          children: [
            AutoRoute(path: '', page: HomeRoute.page),
            AutoRoute(path: 'about', page: AboutRoute.page),
          ],
        ),
      ];
}

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}

@RoutePage()
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('About Page'));
  }
}
