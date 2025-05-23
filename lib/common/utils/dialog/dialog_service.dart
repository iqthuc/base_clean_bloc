import 'package:base_clean_bloc/common/index.dart';
import 'package:flutter/material.dart';

class DialogService {
  static Future<dynamic> showActionDialog(
    BuildContext context, {
    String? leftButtonText,
    String? rightButtonText,
    VoidCallback? onPressedLeftButton,
    VoidCallback? onPressedRightButton,
    String? title,
    Widget? decorationWidget,
    Widget? descriptionWidget,
    String? description,
    TextStyle? titleTextStyle,
    TextStyle? descriptionTextStyle,
    TextStyle? leftButtonTextStyle,
    TextStyle? rightButtonTextStyle,
    Color? leftButtonColor,
    Color? rightButtonColor,
    Color? leftButtonTextColor,
    Color? rightButtonTextColor,
    Function(bool value)? valueCheckbox,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          child: _DialogWidget(
            valueCheckbox: valueCheckbox,
            leftButtonTextStyle: leftButtonTextStyle,
            leftButtonText: leftButtonText,
            leftButtonColor: leftButtonColor,
            leftButtonTextColor: leftButtonTextColor,
            onPressedLeftButton: onPressedLeftButton,
            title: title,
            titleTextStyle: titleTextStyle,
            description: description,
            descriptionWidget: descriptionWidget,
            decorationWidget: decorationWidget,
            descriptionTextStyle: descriptionTextStyle,
            rightButtonText: rightButtonText,
            rightButtonTextColor: rightButtonTextColor,
            onPressedRightButton: onPressedRightButton,
            rightButtonColor: rightButtonColor,
            rightButtonTextStyle: rightButtonTextStyle,
          ),
        );
      },
    );
  }
}

class _DialogWidget extends StatefulWidget {
  final String? leftButtonText;
  final String? rightButtonText;
  final VoidCallback? onPressedLeftButton;
  final VoidCallback? onPressedRightButton;
  final String? title;
  final Widget? decorationWidget;
  final String? description;
  final Widget? descriptionWidget;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? leftButtonTextStyle;
  final TextStyle? rightButtonTextStyle;
  final Color? leftButtonColor;
  final Color? rightButtonColor;
  final Color? leftButtonTextColor;
  final Color? rightButtonTextColor;
  final Function(bool value)? valueCheckbox;

  const _DialogWidget({
    this.leftButtonText,
    this.rightButtonText,
    this.onPressedLeftButton,
    this.onPressedRightButton,
    this.title,
    this.decorationWidget,
    this.description,
    this.descriptionWidget,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.leftButtonTextStyle,
    this.rightButtonTextStyle,
    this.leftButtonColor,
    this.rightButtonColor,
    this.leftButtonTextColor,
    this.rightButtonTextColor,
    this.valueCheckbox,
  });

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<_DialogWidget> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.title ?? "Thông báo",
            // style: AppTextStyles.regularW600(context,
            //     size: 16, color: AppColors.primaryLink), todo
          ),
          const SizedBox(
            height: 4,
          ),
          const Divider(
            color: Color(0xFFD3DCE6),
            thickness: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          widget.decorationWidget != null
              ? Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: widget.decorationWidget,
                )
              : const SizedBox.shrink(),
          widget.descriptionWidget ?? const SizedBox.shrink(),
          widget.description != null
              ? Text(
                  widget.description ?? "",
                  textAlign: TextAlign.center,
                  // style: widget.descriptionTextStyle ??
                  //     AppTextStyles.regularW400(context, size: 16), todo
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 16,
          ),
          widget.valueCheckbox == null
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCheckBoxWidget(
                        onChange: () {
                          setState(() {
                            _selected = !_selected;
                          });
                          widget.valueCheckbox!(_selected);
                        },
                        value: _selected,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "Chặn mọi người thêm tôi vào nhóm",
                          // style: widget.descriptionTextStyle ??
                          //     AppTextStyles.regularW500(context, size: 16),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
          Row(
            children: [
              Expanded(
                child: CustomTextButton(
                  title: widget.leftButtonText ?? "OK",
                  onPressed: widget.onPressedLeftButton,
                  isDisable: false,
                  // backgroundColor:
                  // widget.leftButtonColor ?? AppColors.secondary1,
                  // textStyle: AppTextStyles.regularW400(context,
                  //     size: 14,
                  //     color: widget.leftButtonTextColor ?? AppColors.white),
                ),
              ),
              widget.rightButtonText != null
                  ? const SizedBox(
                      width: 16,
                    )
                  : const SizedBox.shrink(),
              widget.rightButtonText != null
                  ? Expanded(
                      child: CustomTextButton(
                        title: widget.rightButtonText ?? "",
                        onPressed: widget.onPressedRightButton,
                        isDisable: false,
                        // backgroundColor:
                        // widget.rightButtonColor ?? AppColors.blue10,
                        // textStyle: AppTextStyles.regularW400(context,
                        //     size: 14,
                        //     color: widget.rightButtonTextColor ??
                        //         AppColors.primaryDefault),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        ],
      ),
    );
  }
}
