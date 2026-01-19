part of 'real_estate_page_bloc.dart';

final class RealEstatePageState {
  List<RealEstate> realEstates;

  RealEstatePageState({this.realEstates = const []});

  RealEstatePageState copyWith({List<RealEstate>? realEstates}) {
    return RealEstatePageState(realEstates: realEstates ?? this.realEstates);
  }
}
