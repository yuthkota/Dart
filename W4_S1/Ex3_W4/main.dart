import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (buttonType) {
      case ButtonType.primary:
        backgroundColor = Colors.blue;
        textColor = Colors.white;
        break;
      case ButtonType.secondary:
        backgroundColor = Colors.green;
        textColor = Colors.white;
        break;
      case ButtonType.disabled:
        backgroundColor = Colors.grey;
        textColor = Colors.black;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) Icon(icon, color: textColor),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
          const SizedBox(width: 8),
          if (iconPosition == IconPosition.right) Icon(icon, color: textColor),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Submit',
              icon: Icons.thumb_up,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.primary,
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Time',
              icon: Icons.timer,
              iconPosition: IconPosition.right,
              buttonType: ButtonType.secondary,
            ),
            const SizedBox(height: 16),
            CustomButton(
              label: 'Account',
              icon: Icons.account_tree_outlined,
              iconPosition: IconPosition.right,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  ));
}
