import 'package:fitstart/routes/app_route.dart';
import 'package:fitstart/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitstart/providers/user_provider.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  final TextEditingController _heightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    super.dispose();
  }

  void _handleNext() {
    final height = double.tryParse(_heightController.text);
    if (height != null && height > 0) {
      Provider.of<UserProvider>(context, listen: false).setHeight(height);
      Navigator.pushNamed(context, AppRouter.weight);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid height'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      title: 'How tall are you?',
      subtitle: 'Enter your height to help us personalize your fitness journey',
      imagePath: 'assets/images/height.svg',
      inputField: TextField(
        controller: _heightController,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          labelText: 'Height (cm)',
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          suffixText: 'cm',
          suffixStyle: const TextStyle(color: Colors.white),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
      onNext: _handleNext,
    );
  }
}
