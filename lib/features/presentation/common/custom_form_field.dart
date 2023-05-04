import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validator;
  final String label;

  const CustomFormField(
      {required this.controller,
      required this.type,
        this.validator,
      required this.label,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.s30),
        TextFormField(
          decoration:  InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.all(AppSize.s16),
          ),
          keyboardType: type,
          validator: validator,
          controller: controller,
        ),
      ],
    );
  }
}
