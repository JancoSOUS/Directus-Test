import 'package:db_test/Directus/directus.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controllerName = TextEditingController();
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Title',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextField(
                controller: controllerName,
                decoration: const InputDecoration(hintText: 'Enter name here'),
              ),
              ElevatedButton(
                  onPressed: () {
                    sendName(controllerName.text)
                        .then(
                          (value) =>
                              scaffoldMessengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content: Text('Send Complete'),
                            ),
                          ),
                        )
                        .onError(
                          (error, stackTrace) =>
                              scaffoldMessengerKey.currentState!.showSnackBar(
                            const SnackBar(
                              content: Text('Send Failed'),
                            ),
                          ),
                        );
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
