import 'package:base_clean_bloc/common/constants.dart';
import 'package:base_clean_bloc/common/mixins/button_mixin.dart';
import 'package:base_clean_bloc/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LargeCategoryItem extends StatelessWidget with ButtonMixin {
  const LargeCategoryItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final Widget title;
  final Widget icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!canTap) {
          return;
        }
        onTap?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(kSpace12),
        decoration: BoxDecoration(color: const Color(0xffF7F7FC), borderRadius: BorderRadius.circular(kRadius12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: kIconSize24, height: kIconSize24, child: icon),
                const SizedBox(
                  height: kSpace12,
                ),
                DefaultTextStyle(style: const TextStyle(color: Colors.black), child: title),
              ],
            ),
            Assets.icons.arrowRight.svg(width: kIconSize16, height: kIconSize16)
          ],
        ),
      ),
    );
  }
}
