import 'package:fitstart/routes/app_route.dart';
import 'package:fitstart/widgets/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitstart/providers/user_provider.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final TextEditingController _weightController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    super.dispose();
  }

  void _handleNext() {
    final weight = double.tryParse(_weightController.text);
    if (weight != null && weight > 0) {
      Provider.of<UserProvider>(context, listen: false).setWeight(weight);
      Navigator.pushNamed(context, AppRouter.age);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid weight'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _handlePrevious() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      title: 'What is your weight?',
      subtitle: 'Enter your weight to help us track your fitness progress',
      imagePath: 'assets/images/weight.svg',
      inputField: TextField(
        controller: _weightController,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          labelText: 'Weight (kg)',
          labelStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          suffixText: 'kg',
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
      onPrevious: _handlePrevious,
    );
  }
}
