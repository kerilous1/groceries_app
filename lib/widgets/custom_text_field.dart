import 'package:flutter/material.dart';
import '../core/app_theme.dart';

///Custom Text Field
class CustomTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    this.hint,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyles.subtitle.copyWith(color: AppColors.textGrey),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword && _obscureText,
          keyboardType: widget.keyboardType,
          style: AppTextStyles.productTitle.copyWith(fontSize: 18),
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hint,
            hintStyle: AppTextStyles.subtitle.copyWith(color: AppColors.textGrey.withOpacity(0.5)),
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () => setState(() => _obscureText = !_obscureText),
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textGrey,
                    ),
                  )
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.border),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
