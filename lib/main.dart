import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:software_engineering_project/pages/auth/profile_page.dart';
import 'package:software_engineering_project/pages/portfolio.dart';
import 'package:software_engineering_project/pages/settings_page.dart';
import 'package:software_engineering_project/pages/trading_page.dart';
import 'package:software_engineering_project/service/nav_bar.dart';
import 'pages/auth/auth_page.dart';
import 'pages/auth/landing_page.dart';
import 'pages/auth/register_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/browsing_page.dart';
import 'pages/favorite_page.dart';
import 'pages/history_page.dart';
import 'firebase_options.dart';

//notifications
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_app_icon',
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'Notification channel for basic tests',
      ),
      NotificationChannel(
        channelGroupKey: 'scheduled_channel_group',
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        channelDescription: 'A channel for notifications that are scheduled',
        defaultColor: Colors.teal,
        channelShowBadge: true,
        locked: true,
        importance: NotificationImportance.High,
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'Basic group',
      ),
      NotificationChannelGroup(
        channelGroupKey: 'scheduled_channel_group  ',
        channelGroupName: 'Scheduled group',
      )
    ],
    debug: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/auth',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/register': (context) => const RegisterPage(),
        '/login': (context) => const LoginPage(),
        '/auth': (context) => const AuthPage(),
        '/fav': (context) => const FavoritePage(),
        '/browsing': (context) => const BrowsingPage(),
        '/history': (context) => const HistoryPage(),
        '/nav': (context) => const NavBar(),
        '/portfolio': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return PortfolioPage(
            userId: args['userId'],
            dataMap: args['dataMap'],
            chartData: args['chartData'],
            areThereStocks: args['areThereStocks'],
            navigatorKey: args['navigatorKey'],
          );
        },
        '/trade': (context) {
          final args = ModalRoute.of(context)!.settings.arguments
              as Map<String, dynamic>;
          return TradingPage(
            stockCode: args['stockCode'],
            userId: args['userId'],
            price: args['price'],
          );
        },
      },
    );
  }
}
