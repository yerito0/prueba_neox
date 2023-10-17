import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_neox/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:prueba_neox/presentation/pages/details/details_screen.dart';
import 'package:prueba_neox/presentation/pages/user/user_screen.dart';


import 'core/models/user_model.dart';

//Archivo de Rutas de la aplicación con Go_Router
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen();
      },
      routes: <RouteBase>[
        GoRoute(
            name: 'userBlocScreen',
            path: 'userBlocScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const UserBlocScreen();
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'details',
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  final User args = state.extra as User;
                  return DetailsBlocScreen(
                    user: args,
                  );
                },
              ),
            ]),
      ],
    ),
  ],
);
