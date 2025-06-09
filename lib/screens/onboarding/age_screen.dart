import 'package:fitstart/routes/app_route.dart';
import 'package:fitstart/widgets/onboarding_screen.dart';
import 'package:fitstart/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitstart/providers/user_provider.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppTheme.primaryColor,
              onPrimary: Colors.black,
              surface: AppTheme.darkerGrey,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Colors.black,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _handleNext() {
    if (_selectedDate != null) {
      final age = DateTime.now().year - _selectedDate!.year;
      Provider.of<UserProvider>(context, listen: false).setAge(age);
      Provider.of<UserProvider>(context, listen: false).calculateBMI();
      Navigator.pushReplacementNamed(context, AppRouter.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your date of birth'),
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
      title: 'When were you born?',
      subtitle: 'Select your date of birth to personalize your fitness plan',
      imagePath: 'assets/images/age.svg',
      inputField: Container(
        decoration: BoxDecoration(
          color: AppTheme.darkerGrey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            _selectedDate == null
                ? 'Select your date of birth'
                : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
            style: TextStyle(
              color: _selectedDate == null
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white,
              fontSize: 18,
            ),
          ),
          trailing: Icon(Icons.calendar_today, color: AppTheme.primaryColor),
          onTap: () => _selectDate(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onNext: _handleNext,
      onPrevious: _handlePrevious,
      isLastScreen: true,
    );
  }
}
