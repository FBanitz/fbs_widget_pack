import 'package:fbs_widget_pack/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final List<bool> _isLoading = [false, false];

  void _onPressed(int buttonIndex) async {
    setState(() {
      _isLoading[buttonIndex] = true;
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading[buttonIndex] = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FBButton(
                isLoading: _isLoading[0],
                onPressed: () => _onPressed(0),
                child: const Text('Button'),
              ),
              const SizedBox(height: 20),
              FBButton(
                isLoading: _isLoading[1],
                onPressed: () => _onPressed(1),
                icon: const Icon(
                  size: 17,
                  Icons.add,
                ),
                child: const Text('Button'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
