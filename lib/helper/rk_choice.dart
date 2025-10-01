import 'package:flutter/material.dart';
import 'package:template/helper/rk_dimensions.dart';

import '../base_widget/rk_text.dart';
import '../utils/color_resources.dart';

class RkChoice extends StatefulWidget {
  final String label;
  final Function(bool value) onChange;
  final bool isSelected;
  final TextStyle? labelTextStyle;

  RkChoice({
    required this.label,
    required this.onChange,
    required this.isSelected,
    this.labelTextStyle,
  });

  @override
  _RkChoiceState createState() => _RkChoiceState();
}

class _RkChoiceState extends State<RkChoice> {
  bool isSelected = true;
  @override
  void initState() {
    isSelected = widget.isSelected;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RkDimensions.ONE_UNIT_SIZE * 12),
          ),
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          activeColor: ColorResources.COLOR_EE3439,
          onChanged: (value) {
            setState(() {
              isSelected = !isSelected;
            });
            widget.onChange(isSelected);
          },
        ),
        SizedBox(
          width: RkDimensions.SPACE_SIZE_2X,
        ),
        Expanded(
          child: RkText(
            widget.label,
            style: widget.labelTextStyle ?? TextStyle(color: Colors.black),
            textOverflow: TextOverflow.visible,
          ),
        )
      ],
    );
  }
}
