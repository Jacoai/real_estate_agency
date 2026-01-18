part of 'landlord_page_bloc.dart';

sealed class LandlordPageEvent {}

class LandlordPageOpenedEvent extends LandlordPageEvent {}

class AddLandlordEvent extends LandlordPageEvent {
  final String name;
  final String phone;
  final String email;
  final String? adress;
  AddLandlordEvent({
    required this.name,
    required this.email,
    required this.phone,
    this.adress,
  });
}

class DeleteLandlordEvent extends LandlordPageEvent {
  final String id;
  DeleteLandlordEvent({required this.id});
}
