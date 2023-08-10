// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:datxe/models/models.dart';
import '../shared/utils/utils.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class BookingModel {
  final String? id;
  // final String? idBooker;
  // final String? idDriver;
  // final String? idCar;
  final String? idRoute;
  final String? userId;
  final Vehicles? vehicle;
  final String? createAt;
  final int? numberOfPeople;
  final String? route;
  final List<Place>? pickUp;
  final Place? putDown;
  final int? price;
  StatusBooking? status;
  BookingModel({
    String? id,
    this.userId,
    // this.idBooker,
    // this.idDriver,
    // this.idCar,
    this.idRoute,
    this.vehicle,
    this.createAt,
    this.numberOfPeople,
    this.route,
    this.pickUp,
    this.putDown,
    this.price,
    this.status = StatusBooking.WAITING,
  }) : id = (id ?? uuid.v4());

  static vehicleToMap(Vehicles vehicles) {
    return vehicles.name;
  }

  static statusToMap(StatusBooking statusBooking) {
    return statusBooking.name;
  }

  static Map<String, dynamic> toMap(BookingModel bookingModel) {
    return <String, dynamic>{
      'userId': bookingModel.userId,
      'id': bookingModel.id,
      'idRoute': bookingModel.idRoute,
      'vehicle': vehicleToMap(bookingModel.vehicle!),
      'createAt': bookingModel.createAt,
      'numberOfPeople': bookingModel.numberOfPeople,
      'route': bookingModel.route,
      'pickUp': bookingModel.pickUp!.map((x) => Place.toMap(x)).toList(),
      'putDown': Place.toMap(bookingModel.putDown!),
      'price': bookingModel.price,
      'status': statusToMap(bookingModel.status!),
    };
  }

  static Vehicles vehicleFromMap(String text) {
    for (Vehicles vehicle in Vehicles.values) {
      if (vehicle.name.toString() == text) {
        return vehicle;
      }
    }
    throw Exception('Vehicle not found');
  }

  static StatusBooking statusFromMap(String text) {
    for (StatusBooking statusbooking in StatusBooking.values) {
      if (statusbooking.name.toString() == text) {
        return statusbooking;
      }
    }
    throw Exception('Statusbooking not found');
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    Vehicles nameVehicle = vehicleFromMap(map['vehicle']);
    StatusBooking nameStatus = statusFromMap(map['status']);
    return BookingModel(
      userId: map['userId'] != null ? map['userId'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      idRoute: map['idRoute'] != null ? map['idRoute'] as String : null,
      vehicle: map['vehicle'] != null ? nameVehicle : null,
      createAt: map['createAt'] != null ? map['createAt'] as String : null,
      numberOfPeople:
          map['numberOfPeople'] != null ? map['numberOfPeople'] as int : null,
      route: map['route'] != null ? map['route'] as String : null,
      pickUp: map['pickUp'] != null
          ? List<Place>.from(
              (map['pickUp'] as List<dynamic>).map<Place?>(
                (x) => Place.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      putDown: map['putDown'] != null
          ? Place.fromMap(map['putDown'] as Map<String, dynamic>)
          : null,
      price: map['price'] != null ? map['price'] as int : null,
      status: map['status'] != null ? nameStatus : null,
    );
  }
}
