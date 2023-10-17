import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double wb = 200;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: wb,
              child: ElevatedButton(
                onPressed: () => context.goNamed('userBlocScreen'),
                child: const Text('User con BLoC'),
              ),
            ),
            SizedBox(
              width: wb,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('User con Provider'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
