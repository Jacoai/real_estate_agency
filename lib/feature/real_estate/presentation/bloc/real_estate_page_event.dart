part of 'real_estate_page_bloc.dart';

sealed class RealEstatePageEvent {}

class RealEstatePageOpenedEvent extends RealEstatePageEvent {}

class StreamLandlordsEvent extends RealEstatePageEvent {}

class AddRealEstateEvent extends RealEstatePageEvent {
  final String title;
  final String address;
  final String type;
  final double area;
  final String status;
  final String landlordId;

  AddRealEstateEvent({
    required this.address,
    required this.area,
    required this.status,
    required this.title,
    required this.type,
    required this.landlordId,
  });
}

class DeleteRealEstateEvent extends RealEstatePageEvent {
  final String id;
  DeleteRealEstateEvent({required this.id});
}
