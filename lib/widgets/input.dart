import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    super.key,
    required this.controller,
    required this.inputLabel,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String inputLabel;
  final void Function()? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: (_) => onSubmitted?.call(),
      decoration: InputDecoration(
        labelText: inputLabel,
      ),
    );
  }
}
