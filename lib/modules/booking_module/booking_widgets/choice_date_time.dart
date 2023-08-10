import 'package:datxe/modules/booking_module/booking_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';

class ChoiceDateTime extends GetView<BookingViewModel> {
  const ChoiceDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppMetrics.BUTTON_HEIGHT,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => controller.chooseDate(context),
              child: _buildTimeContainer(CupertinoIcons.calendar,
                  controller.dateController.value!, "dd/MM/yyyy"),
            ),
          ),
          const SizedBox(width: AppMetrics.PADDING_SCREEN),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => controller.chooseTime(context),
              child: _buildTimeContainer(Icons.keyboard_arrow_down,
                  controller.timeController.value!, "hh:mm"),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTimeContainer(
    IconData icon, TextEditingController controller, String hintText) {
  return Container(
    padding: const EdgeInsets.all(AppMetrics.WIDGET_SPACING),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppMetrics.BUTTON_BORDER),
      color: WHITE_COLOR,
      border: Border.all(color: BODER_COLOR, width: 1),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextFormField(
            enabled: false,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 9),
              hintStyle: STYLE_SMALL.copyWith(color: LIGHT_BLACK),
            ),
            style: STYLE_SMALL,
          ),
        ),
        Icon(icon)
      ],
    ),
  );
}

Padding paddingWidget(Widget widget) => Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppMetrics.DISTANCE_BETWEEN_FORMS),
      child: widget,
    );
