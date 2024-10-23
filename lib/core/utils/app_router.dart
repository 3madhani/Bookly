import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly/Features/home/presentation/views/home_view.dart';
import 'package:bookly/Features/search/data/repo/search_repo_impl.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/searched_books_cubit.dart';
import 'package:bookly/Features/search/presentation/views/search_view.dart';
import 'package:bookly/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/homeView';
  static const String bookDetailsRoute = '/bookDetailsView';
  static const String searchRoute = '/searchView';

  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1500),
              child: const HomeView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Define the zoom transition
                return ScaleTransition(
                  scale: animation.drive(CurveTween(curve: Curves.easeInOut)),
                  child: child,
                );
              });
        },
      ),
      GoRoute(
        path: bookDetailsRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchedBooksCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
