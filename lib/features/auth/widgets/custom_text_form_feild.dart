import 'package:flutter/material.dart';
import 'package:snap_buy_app/core/themes/colors_manager.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? cursorColor;
 final bool obscureText;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintStyle,
    this.fillColor,
    this.cursorColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: 10,
            ),
            child: TextFormField(
              cursorColor: widget.cursorColor ?? ColorsManager.redColor,
              controller: widget.controller,
              obscureText: widget.obscureText ? isSecure : false,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                suffixIcon: widget.obscureText
                    ? IconButton(
                        icon: Icon(
                          isSecure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                      )
                    : null,
                filled: true,
                fillColor: widget.fillColor ?? Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                hintText: widget.hintText,
                hintStyle:
                    widget.hintStyle ?? TextStyle(color: Colors.grey.shade500),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Your ${widget.hintText}';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
