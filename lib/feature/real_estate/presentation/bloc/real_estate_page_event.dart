part of 'real_estate_page_bloc.dart';

sealed class RealEstatePageEvent {}

class RealEstatePageOpenedEvent extends RealEstatePageEvent {}

class AddRealEstateEvent extends RealEstatePageEvent {
  final String title;
  final String address;
  final String type;
  final double area;
  final String status;

  AddRealEstateEvent({
    required this.address,
    required this.area,
    required this.status,
    required this.title,
    required this.type,
  });
}

class DeleteRealEstateEvent extends RealEstatePageEvent {
  final String id;
  DeleteRealEstateEvent({required this.id});
}
