import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  static const String title = 'GoRouter ';

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
        routeInformationProvider: _router.routeInformationProvider,
      );
  final GoRouter _router = GoRouter(
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    routes: <GoRoute>[
      GoRoute(
        routes: <GoRoute>[
          GoRoute(
            path: 'page2',
            builder: (BuildContext context, GoRouterState state) =>
                const Page2Screen(),
          ),
          GoRoute(
            path: 'page3',
            builder: (BuildContext context, GoRouterState state) =>
                const Page3Screen(),
          ),
          GoRoute(
            path: 'page4',
            builder: (BuildContext context, GoRouterState state) =>
                const Page4Screen(),
          ),
        ],
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const Page1Screen(),
      ),
    ],
  );
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text(error.toString()),
      ),
    );
  }
}

class Page1Screen extends StatelessWidget {
  const Page1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(App.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/page'),
              child: const Text('Page 2'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/page3'),
              child: const Text('Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2Screen extends StatelessWidget {
  const Page2Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Page2Screen'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go back to homepage'),
              ),
            ],
          ),
        ),
      );
}

class Page3Screen extends StatelessWidget {
  const Page3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Page3Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to homepage'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page4'),
              child: const Text('Page 4'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page4Screen extends StatelessWidget {
  const Page4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(router.location.toString()),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
