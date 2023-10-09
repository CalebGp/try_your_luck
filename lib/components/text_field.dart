import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLines;
  final int? minLines;
  final String? hint;
  final Function(String)? func;
  final TextInputType? inputType;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
    this.minLines,
    this.hint,
    this.maxLines,
    this.inputType,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          textAlign: TextAlign.center,
          controller: controller,
          onSubmitted: func,
          decoration: InputDecoration(
            hintText: hint ?? "",
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          keyboardType: inputType ?? TextInputType.text,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
