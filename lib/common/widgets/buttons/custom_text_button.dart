import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final TextStyle? textStyle;
  final double borderRadius;
  final Color? backgroundColor;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final bool isDisable;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? textColor;

  const CustomTextButton({
    super.key,
    this.onPressed,
    this.textColor,
    this.textStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.isDisable = true,
    this.horizontalPadding,
    this.verticalPadding,
    this.backgroundColor = Colors.blue, //todo
    this.borderRadius = 2,
    required this.title,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isDisable ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isDisable ? Colors.blue : backgroundColor, //todo
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0,
          vertical: verticalPadding ?? 4,
        ),
        child: Center(
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: leadingIcon ?? const SizedBox.shrink(),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textStyle, //todo:
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0),
                child: trailingIcon ?? const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
