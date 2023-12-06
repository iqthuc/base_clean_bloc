import 'package:base_clean_bloc/common/index.dart';
import 'package:flutter/material.dart';

class SmallCategoryItem extends StatelessWidget {
  const SmallCategoryItem({
    super.key,
    required this.icon,
    required this.title,
  });
  final Widget icon;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: kIconSize16,
          height: kIconSize16,
          child: icon,
        ),
        const SizedBox(
          height: kSpace12,
        ),
        DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
          ),
          child: title,
        ),
      ],
    );
  }
}
