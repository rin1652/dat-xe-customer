import 'package:datxe/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import '../../config/config.dart';
import '../../routes/routes.dart';
import '../../services/services.dart';
import '../../shared/shared.dart';

final listRoute = [
  "Nha Trang - Huế",
  "Nha Trang - Đà Nẵng",
  "Nha Trang - Hà Nội",
  "Nha Trang - Hồ Chí Minh",
  "Huế - Quảng trị"
];

class BookingViewModel extends GetxController {
  Rxn<Place> place = Rxn<Place>(Place(lat: 0, lng: 0));
  Rxn<TextEditingController> dateController =
      Rxn<TextEditingController>(TextEditingController());
  Rxn<TextEditingController> timeController =
      Rxn<TextEditingController>(TextEditingController());
  Rxn<DateTime> pickedTime = Rxn<DateTime>(DateTime.now());
  Rxn<DateTime> pickedDate = Rxn<DateTime>(DateTime.now());

  Rxn<Vehicles> vehicle = Rxn<Vehicles>(Vehicles.SEVEN_SEATS);
  Rxn<bool> fullcar = Rxn<bool>(false);
  Rxn<int> numberPeople = Rxn<int>(0);
  Rxn<String> route = Rxn<String>(listRoute[0]);
  Rxn<StopPoint> pickUp = Rxn<StopPoint>();
  Rxn<StopPoint> pickUp2 = Rxn<StopPoint>();
  Rxn<Place> putDown = Rxn<Place>(null);

  Rxn<int> maxNumberPeople = Rxn<int>(7);
  Rxn<int> pickUpNumberPeople = Rxn<int>(0);

  Rxn<TextEditingController> phoneNumber1 =
      Rxn<TextEditingController>(TextEditingController());
  Rxn<TextEditingController> phoneNumber2 =
      Rxn<TextEditingController>(TextEditingController());

  Rxn<bool> diemdon1 = Rxn<bool>(false);
  Rxn<bool> diemdon2 = Rxn<bool>(false);

  Rxn<int> numberOfPickUp = Rxn<int>(0);

  @override
  void onClose() {
    dateController.value?.dispose();
    timeController.value?.dispose();
    phoneNumber1.value?.dispose();
    phoneNumber2.value?.dispose();
    super.onClose();
  }

  /// logic related to the number of guests
  setPickUpNumber(int value) {
    pickUpNumberPeople.value = value;
  }

  numerPeopleAdd() {
    if (numberPeople.value! == maxNumberPeople.value) return;
    numberPeople.value = numberPeople.value! + 1;
  }

  numerPeopleRemove() {
    if (numberPeople.value! == 0) return;
    numberPeople.value = numberPeople.value! - 1;
  }

  /// logic related to customer return
  void addPlacePutDown() {
    if (putDown.value == null) {
      goGooglemap(false);
    }
  }

  deletePutDown() {
    putDown.value = null;
  }

  deletePickUp(String diemdon) {
    if (diemdon == AppValue.diemDon1) {
      pickUp.value = null;
      phoneNumber1.value!.text = "";
      diemdon1.value = false;
      numberOfPickUp.value = numberOfPickUp.value! - 1;
    } else if (diemdon == AppValue.diemDon2) {
      pickUp2.value = null;
      phoneNumber2.value!.text = "";
      diemdon2.value = false;
      numberOfPickUp.value = numberOfPickUp.value! - 1;
    }
  }

  ///logic date and time
  Future chooseDate(BuildContext context) async {
    await picker.DatePicker.showDatePicker(
      context,
      minTime: DateTime.now(),
      currentTime: pickedDate.value,
      theme: const picker.DatePickerTheme(
          doneStyle: TextStyle(color: PRIMARY_COLOR)),
      onConfirm: (time) {
        dateController.value?.text =
            AppUtils.convertDateTime2String(time, format: "dd/MM/yyyy");
        pickedDate.value = time;
      },
    );
  }

  Future chooseTime(BuildContext context) async {
    await picker.DatePicker.showTimePicker(
      context,
      currentTime: pickedTime.value,
      showSecondsColumn: false,
      theme: const picker.DatePickerTheme(
          doneStyle: TextStyle(color: PRIMARY_COLOR)),
      onConfirm: (time) {
        timeController.value?.text =
            AppUtils.convertDateTime2String(time, format: "HH:mm");
        pickedTime.value = time;
      },
    );
  }

  ///logic related to pick up customer
  bool maxNumberOfPickUp() {
    return numberOfPickUp.value == 2;
  }

  void addPlacePutUp() {
    if (maxNumberOfPickUp()) {
      // snackbar of get
      Get.snackbar("Thông báo", "Chỉ chọn tối đa 2 điểm đón");
      return;
    }
    goGooglemap(true);
  }

  /// logic related to chossce car
  void setNumberPeopleCar(Vehicles vehicles) {
    switch (vehicles) {
      case Vehicles.SEVEN_SEATS:
        maxNumberPeople.value = 7;
        break;
      case Vehicles.TWELVE_SEATS:
        maxNumberPeople.value = 11;
        break;
      case Vehicles.LIMOUSINE:
        maxNumberPeople.value = 12;
        break;
      case Vehicles.CRANE:
        maxNumberPeople.value = 4;
        break;
    }
    setVehicle(vehicles);
    numberPeople.value = 0;
  }

  setVehicle(Vehicles value) {
    vehicle.value = value;
  }

  bool isVehicle(Vehicles vehicles) {
    return vehicle.value == vehicles;
  }

  /// logic related to google map
  void goGooglemap(bool isPutUp) async {
    var value = await Get.toNamed(Routes.googlemap);

    place.value = value as Place;
    if (pickUp.value == null && isPutUp) {
      pickUp.value = StopPoint(place: place.value!);
      diemdon1.value = true;
      numberOfPickUp.value = numberOfPickUp.value! + 1;
    } else if (pickUp2.value == null && isPutUp) {
      pickUp2.value = StopPoint(place: place.value!);
      diemdon2.value = true;
      numberOfPickUp.value = numberOfPickUp.value! + 1;
    } else if (putDown.value == null && !isPutUp) {
      putDown.value = place.value;
    }
  }

  void addBooking(BookingModel bookingModel) {
    bookingRepository.addBooking(bookingModel);
  }

  void goHome() {
    Get.offAllNamed(Routes.home);
  }

  ///logic related to full car
  setFullCar(bool value) {
    fullcar.value = value;
  }

  ///logic related to route
  setRoute(String value) {
    route.value = value;
  }
}
