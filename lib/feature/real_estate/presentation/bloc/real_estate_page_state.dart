part of 'real_estate_page_bloc.dart';

final class RealEstatePageState {
  List<RealEstate> realEstates;
  List<Landlord> landlords;

  RealEstatePageState({this.realEstates = const [], this.landlords = const []});

  RealEstatePageState copyWith({
    List<RealEstate>? realEstates,
    List<Landlord>? landlords,
  }) {
    return RealEstatePageState(
      realEstates: realEstates ?? this.realEstates,
      landlords: landlords ?? this.landlords,
    );
  }
}
