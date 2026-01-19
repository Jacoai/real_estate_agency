part of 'landlord_page_bloc.dart';

class LandlordPageState {
  List<Landlord> landlords;

  LandlordPageState({this.landlords = const []});

  LandlordPageState copyWith({List<Landlord>? landlords}) {
    return LandlordPageState(landlords: landlords ?? this.landlords);
  }
}
