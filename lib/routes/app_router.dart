import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// your feature imports
import 'package:chat_app/features/auth/presentation/pages/SplashScreen.dart';
// import 'package:chat_app/features/auth/presentation/pages/LoginView.dart';
// import 'package:chat_app/features/auth/presentation/pages/RegisterView.dart';
// import 'package:chat_app/features/auth/presentation/pages/ForgotPassword.dart';
// import 'package:chat_app/features/auth/presentation/pages/ChangePassword.dart';

// NOTE: these next folders exist in your features directory (you’ll add pages there later)
// import 'package:chat_app/features/home/presentation/pages/HomeView.dart';
// import 'package:chat_app/features/main/presentation/pages/MainView.dart';
// import 'package:chat_app/features/profile/presentation/pages/ProfileView.dart';
// import 'package:chat_app/features/chat/presentation/pages/ChatView.dart';
// import 'package:chat_app/features/users/presentation/pages/UserListView.dart';
// import 'package:chat_app/features/friends/presentation/pages/FriendsView.dart';
// import 'package:chat_app/features/friends_request/presentation/pages/FriendsRequestView.dart';
// import 'package:chat_app/features/notifications/presentation/pages/NotificationView.dart';

// app routes
import 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splash,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) =>  SplashScreen(),
      ),
      // GoRoute(
      //   path: AppRoutes.login,
      //   builder: (context, state) => const LoginView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.register,
      //   builder: (context, state) => const RegisterView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.forgotPassword,
      //   builder: (context, state) => const ForgotPassword(),
      // ),
      // GoRoute(
      //   path: AppRoutes.changePassword,
      //   builder: (context, state) => const ChangePassword(),
      // ),
      // GoRoute(
      //   path: AppRoutes.home,
      //   builder: (context, state) => const HomeView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.main,
      //   builder: (context, state) => const MainView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.profile,
      //   builder: (context, state) => const ProfileView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.chat,
      //   builder: (context, state) => const ChatView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.userList,
      //   builder: (context, state) => const UserListView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.friends,
      //   builder: (context, state) => const FriendsView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.friendsRequest,
      //   builder: (context, state) => const FriendsRequestView(),
      // ),
      // GoRoute(
      //   path: AppRoutes.notifications,
      //   builder: (context, state) => const NotificationView(),
      // ),
    ],
  );
});
