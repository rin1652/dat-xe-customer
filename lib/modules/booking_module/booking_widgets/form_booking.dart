import 'package:datxe/models/models.dart';
import 'package:datxe/shared/shared.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../booking_module.dart';
import 'package:datxe/data/car_data.dart';

class FormBooking extends GetView<BookingViewModel> {
  FormBooking({super.key});

  final List<DropdownMenuItem> listRoute = [
    const DropdownMenuItem(
        value: "Nha Trang - Huế", child: Text("Nha Trang - Huế")),
    const DropdownMenuItem(
        value: "Nha Trang - Đà Nẵng", child: Text("Nha Trang - Đà Nẵng")),
    const DropdownMenuItem(
        value: "Nha Trang - Quy Nhơn", child: Text("Nha Trang - Quy Nhơn")),
    const DropdownMenuItem(
        value: "Nha Trang - Hồ Chí Minh",
        child: Text("Nha Trang - Hồ Chí Minh")),
    const DropdownMenuItem(
        value: "Huế - Quảng trị", child: Text("Huế - Quảng trị"))
  ];

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    final size = MediaQuery.of(context).size;
    return GetX<BookingViewModel>(
      builder: (controller) => Container(
        decoration: const BoxDecoration(color: PRIMARY_LIGHT_WHITE_COLOR),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                AppMetrics.PADDING_SCREEN,
                AppMetrics.PADDING_SCREEN,
                AppMetrics.PADDING_SCREEN,
                AppMetrics.PADDING_SCREEN + keyboardSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabel("Chọn dòng xe"),
                choiceVehicle(),
                fullCar(),
                remind(),
                _buildLabel(
                    "Chọn số người đi (tối đa ${controller.maxNumberPeople} người)"),
                choiceNumberPeople(),
                _buildLabel("Chọn thời gian"),
                choiceDateTimeWidget(),
                _buildLabel("Chọn tuyến"),
                choiceRoute(),
                _buildLabel("Chọn điểm đón (tối đa 2 điểm)"),
                if (controller.diemdon1.value!)
                  builderPickUp(controller.pickUp.value!, size,
                      controller.phoneNumber1.value!, AppValue.diemDon1),
                if (controller.diemdon2.value!)
                  builderPickUp(controller.pickUp2.value!, size,
                      controller.phoneNumber2.value!, AppValue.diemDon2),
                chosseAddPickUp("Thêm điểm đón", controller.addPlacePutUp),
                _buildLabel("Chọn điểm trả"),
                if (controller.putDown.value != null)
                  builderPickDown(controller.putDown.value!),
                chosseAddPickUp("Thêm điểm trả", controller.addPlacePutDown),
                buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonSubmit() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: AppMetrics.PADDING_FORM * 2),
      child: SizedBox(
        height: AppMetrics.BUTTON_HEIGHT,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Xác nhận đặt xe"),
        ),
      ),
    );
  }

  Widget builderPickDown(Place palce) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppMetrics.PADDING_FORM * 2),
      child: Container(
        width: double.infinity,
        height: AppMetrics.BUTTON_HEIGHT,
        padding:
            const EdgeInsets.symmetric(horizontal: AppMetrics.PADDING_FORM),
        decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(AppMetrics.BUTTON_BORDER),
          border: Border.all(color: BODER_COLOR, width: 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      palce.address!,
                      style: STYLE_SMALL,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                      child: const Icon(Icons.close),
                      onTap: () {
                        controller.deletePutDown();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget builderPickUp(StopPoint stopPoint, Size size,
      TextEditingController phoneController, String diemdon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppMetrics.PADDING_FORM * 2),
      child: Container(
        width: double.infinity,
        height: AppMetrics.BUTTON_HEIGHT * 2,
        padding:
            const EdgeInsets.symmetric(horizontal: AppMetrics.PADDING_FORM),
        decoration: BoxDecoration(
          color: WHITE_COLOR,
          borderRadius: BorderRadius.circular(AppMetrics.BUTTON_BORDER),
          border: Border.all(color: BODER_COLOR, width: 1),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.location_on_sharp),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      stopPoint.place!.address!,
                      style: STYLE_SMALL,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  InkWell(
                      child: const Icon(Icons.close),
                      onTap: () {
                        controller.deletePickUp(diemdon);
                      }),
                ],
              ),
            ),
            Container(
              height: 0.2,
              width: size.width * 0.8,
              color: BODER_COLOR, // Màu sắc của đoạn đường line
            ),
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.phone),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Số điện thoại khách",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 9),
                        hintStyle: STYLE_SMALL.copyWith(color: LIGHT_BLACK),
                      ),
                      style: STYLE_SMALL,
                      onFieldSubmitted: (value) {
                        phoneController.text = value;
                        stopPoint.phoneNumber = value;
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget chosseAddPickUp(String text, Function ontap) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: DottedBorder(
        dashPattern: const [5, 4], // Độ dài và khoảng cách của từng đoạn đứt
        strokeWidth: 1, // Độ dày viền
        color: Colors.grey, // Màu viền
        borderType: BorderType.RRect, // Định dạng độ cong cho góc
        radius:
            const Radius.circular(AppMetrics.BUTTON_BORDER), // Độ cong cho góc

        child: Container(
            height: AppMetrics.BUTTON_HEIGHT,
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: AppMetrics.PADDING_FORM),
            decoration: BoxDecoration(
              color: WHITE_COLOR,
              borderRadius: BorderRadius.circular(AppMetrics.BUTTON_BORDER),
              // border: Border.all(color: BODER_COLOR, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: NEUTRAL_BLACK_COLOR,
                ),
                Text(
                  text,
                  style: STYLE_SMALL,
                ),
              ],
            )),
      ),
    );
  }

  Widget choiceRoute() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppMetrics.PADDING_FORM),
      decoration: BoxDecoration(
        color: WHITE_COLOR,
        borderRadius: BorderRadius.circular(AppMetrics.BUTTON_BORDER),
        border: Border.all(color: BODER_COLOR, width: 1),
      ),
      child: DropdownButton(
        items: listRoute,
        underline: const SizedBox(),
        value: controller.route.value,
        icon: const Icon(Icons.keyboard_arrow_right),
        style: STYLE_SMALL,
        isExpanded: true,
        onChanged: (value) {
          controller.setRoute(value);
        },
      ),
    );
  }

  Widget choiceDateTimeWidget() {
    return const ChoiceDateTime();
  }

  Widget choiceNumberPeople() => Card(
        child: SizedBox(
          height: AppMetrics.INPUT_FORM_HEIGHT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  controller.numerPeopleRemove();
                },
                icon: const Icon(
                  Icons.remove,
                  color: LIGHT_BLACK,
                ),
              ),
              Container(
                height: 20, // Độ dày của đoạn đường line
                width: 1, // Chiều rộng của đoạn đường line
                color: BODER_COLOR, // Màu sắc của đoạn đường line
              ),
              const Spacer(),
              Text("${controller.numberPeople.value!}", style: STYLE_SMALL),
              const Spacer(),
              Container(
                height: 20, // Độ dày của đoạn đường line
                width: 1, // Chiều rộng của đoạn đường line
                color: BODER_COLOR, // Màu sắc của đoạn đường line
              ),
              IconButton(
                onPressed: () {
                  controller.numerPeopleAdd();
                },
                icon: const Icon(
                  Icons.add,
                  color: NEUTRAL_BLACK_COLOR,
                ),
              ),
            ],
          ),
        ),
      );

  Widget remind() => paddingWidget(
        Row(
          children: [
            const Icon(Icons.info, color: PRIMARY_COLOR),
            const SizedBox(width: 4),
            const Text("Đặt bao xe sẽ được ", style: STYLE_SMALL),
            InkWell(
                onTap: () {
                  controller.goHome();
                },
                child: Text("giảm giá",
                    style: STYLE_SMALL.copyWith(color: PRIMARY_COLOR))),
          ],
        ),
      );

  Widget fullCar() {
    return Row(
      children: [
        _buildLabel("Đặt bao xe"),
        const Spacer(),
        CupertinoSwitch(
            value: controller.fullcar.value!,
            activeColor: PRIMARY_COLOR,
            onChanged: (bool value) {
              controller.setFullCar(value);
            }),
      ],
    );
  }

  Widget choiceVehicle() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buttonChoiceCar(
              Vehicles.SEVEN_SEATS, controller.isVehicle(Vehicles.SEVEN_SEATS)),
          buttonChoiceCar(
              Vehicles.LIMOUSINE, controller.isVehicle(Vehicles.LIMOUSINE)),
          buttonChoiceCar(Vehicles.CRANE, controller.isVehicle(Vehicles.CRANE)),
          buttonChoiceCar(Vehicles.TWELVE_SEATS,
              controller.isVehicle(Vehicles.TWELVE_SEATS)),
        ],
      ),
    );
  }

  Padding buttonChoiceCar(Vehicles vehicles, bool picked) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppMetrics.BUTTON_BORDER,
      ),
      child: SizedBox(
        height: AppMetrics.INPUT_FORM_HEIGHT,
        width: 120,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: picked ? PRIMARY_COLOR : WHITE_COLOR),
          onPressed: () {
            controller.setNumberPeopleCar(vehicles);
          },
          child: Text(CarData.listCar[vehicles] as String,
              style: picked
                  ? STYLE_SMALL.copyWith(color: WHITE_COLOR)
                  : STYLE_SMALL),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) =>
      paddingWidget(Text(text, style: STYLE_MEDIUM_BOLD));
}
