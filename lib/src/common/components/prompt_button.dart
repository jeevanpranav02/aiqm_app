import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../../config/app_layout.dart';
import '../../config/app_text.dart';

class PromptButton extends StatelessWidget {
  const PromptButton({
    super.key,
    required this.onPressed,
    required this.textContent,
    required this.height,
    required this.width,
    required this.isEnabled,
    required this.textContentColor,
    required this.isEnabledColor,
  });
  final double height;
  final double width;
  final String textContent;
  final Function onPressed;
  final bool isEnabled;
  final Color isEnabledColor;
  final Color textContentColor;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isEnabled,
      child: Material(
        borderRadius: AppLayout.borderRadiusMini,
        color: isEnabled ? isEnabledColor : AppColors.disabledButtonColor,
        child: SizedBox(
          height: height,
          width: width,
          child: InkWell(
            borderRadius: AppLayout.borderRadiusMini,
            onTap: isEnabled ? onPressed as void Function()? : null,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  textContent,
                  style: AppText.buttonTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
