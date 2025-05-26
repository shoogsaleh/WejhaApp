import 'package:flutter/material.dart';

import 'WejhaApp.dart'; // يحتوي على WelcomeScreen و SignupScreen
import 'LoginPage.dart';
import 'HomePage.dart';
import 'profile_page.dart';
import 'edit_profile_page.dart';
import 'EventDetailsPage.dart';
import 'TicketBookingPage.dart';
import 'TicketsPage.dart';
import 'AllEventsPage.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wejha App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/registration': (context) => const SignupScreen(),
        '/login': (context) =>  LoginPage(),
        '/home': (context) =>  HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/edit_profile': (context) => const EditProfilePage(),
        '/ticket_booking': (context) =>  TicketBookingPage(),
        '/all_events': (context) => const AllEventsPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/event_details':
            final args = settings.arguments;
            if (args == null || args is! Map<String, String>) {
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('No or invalid event data provided')),
                ),
              );
            }
            return MaterialPageRoute(
              builder: (_) => EventDetailsPage(event: args),
            );

          case '/tickets':
            final args = settings.arguments;
            if (args == null || args is! List<Ticket>) {
              return MaterialPageRoute(
                builder: (_) => const Scaffold(
                  body: Center(child: Text('No or invalid tickets data provided')),
                ),
              );
            }
            return MaterialPageRoute(
              builder: (_) => TicketsPage(tickets: args),
            );

          default:
            return null;
        }
      },
    );
  }
}
