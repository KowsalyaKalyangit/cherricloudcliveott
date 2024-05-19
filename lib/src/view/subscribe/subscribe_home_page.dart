import 'package:cliveott/src/view/subscribe/subscription_page.dart';
import 'package:flutter/material.dart';

class SubscriptionHomePage extends StatefulWidget {
  const SubscriptionHomePage({super.key});

  @override
  State<SubscriptionHomePage> createState() => _SubscriptionHomePageState();
}

class _SubscriptionHomePageState extends State<SubscriptionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 146, 20, 11),
                Color.fromARGB(255, 151, 11, 11),
                Color.fromARGB(255, 146, 20, 11),
              ]),
        ),
      )),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 146, 20, 11),
                Color.fromARGB(255, 151, 11, 11),
                Color.fromARGB(255, 146, 20, 11),
              ]),
        ),
        child: SubscriptionPage(),
      ),
    );
  }
}
