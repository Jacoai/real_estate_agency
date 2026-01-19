import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:real_estate_agency/core/database/database.dart';
import 'package:real_estate_agency/feature/landlords/models/landlord.dart';
import 'package:real_estate_agency/feature/real_estate/model/real_estate.dart';
import 'package:real_estate_agency/main.dart';
import 'package:uuid/uuid.dart';

part 'real_estate_page_event.dart';
part 'real_estate_page_state.dart';

class RealEstatePageBloc
    extends Bloc<RealEstatePageEvent, RealEstatePageState> {
  Uuid uuid = Uuid();
  RealEstatePageBloc() : super(RealEstatePageState()) {
    on<RealEstatePageOpenedEvent>(_realEstatePageOpenedEvent);
    on<AddRealEstateEvent>(_addRealEstateEvent);
    on<DeleteRealEstateEvent>(_deleteRealEstateEvent);
    on<StreamLandlordsEvent>(_streamLandlordsEvent);
  }

  FutureOr<void> _realEstatePageOpenedEvent(
    RealEstatePageOpenedEvent event,
    Emitter<RealEstatePageState> emit,
  ) async {
    await emit.onEach(
      database
          .select(database.realEstateTable)
          .map(
            (row) => RealEstate(
              id: row.id,
              address: row.address,
              area: row.area,
              status: row.status,
              title: row.title,
              type: row.type,
            ),
          )
          .watch(),
      onData: (data) => emit(state.copyWith(realEstates: data)),
    );
  }

  FutureOr<void> _addRealEstateEvent(
    AddRealEstateEvent event,
    Emitter<RealEstatePageState> emit,
  ) async {
    await database
        .into(database.realEstateTable)
        .insert(
          RealEstateTableCompanion.insert(
            id: uuid.v1(),
            address: event.address,
            area: event.area,
            status: event.status,
            title: event.title,
            type: event.type,
            landlordId: event.landlordId,
          ),
        );
  }

  FutureOr<void> _deleteRealEstateEvent(
    DeleteRealEstateEvent event,
    Emitter<RealEstatePageState> emit,
  ) async {
    await (database.delete(
      database.realEstateTable,
    )..where((tbl) => tbl.id.equals(event.id))).go();
  }

  FutureOr<void> _streamLandlordsEvent(
    StreamLandlordsEvent event,
    Emitter<RealEstatePageState> emit,
  ) async {
    await emit.onEach(
      database
          .select(database.landlordTable)
          .map(
            (row) => Landlord(
              id: row.id,
              name: row.name,
              phone: row.phone,
              email: row.email,
              adress: row.adress,
            ),
          )
          .watch(),
      onData: (data) => emit(state.copyWith(landlords: data)),
    );
  }
}
