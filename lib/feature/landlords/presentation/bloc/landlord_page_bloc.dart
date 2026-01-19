import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:real_estate_agency/core/database/database.dart';
import 'package:real_estate_agency/feature/landlords/models/landlord.dart';
import 'package:real_estate_agency/main.dart';
import 'package:uuid/uuid.dart';

part 'landlord_page_event.dart';
part 'landlord_page_state.dart';

class LandlordPageBloc extends Bloc<LandlordPageEvent, LandlordPageState> {
  Uuid uuid = Uuid();
  LandlordPageBloc() : super(LandlordPageState()) {
    on<LandlordPageOpenedEvent>(_landlordPageOpenedEvent);
    on<AddLandlordEvent>(_addLandlordEvent);
    on<DeleteLandlordEvent>(_deleteLandlordEvent);
  }

  FutureOr<void> _landlordPageOpenedEvent(
    LandlordPageOpenedEvent event,
    Emitter<LandlordPageState> emit,
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

  FutureOr<void> _addLandlordEvent(
    AddLandlordEvent event,
    Emitter<LandlordPageState> emit,
  ) async {
    await database
        .into(database.landlordTable)
        .insert(
          LandlordTableCompanion.insert(
            id: uuid.v1(),
            name: event.name,
            phone: event.phone,
            email: event.email,
            adress: Value<String?>(event.adress),
          ),
        );
  }

  FutureOr<void> _deleteLandlordEvent(
    DeleteLandlordEvent event,
    Emitter<LandlordPageState> emit,
  ) async {
    await (database.delete(
      database.landlordTable,
    )..where((tbl) => tbl.id.equals(event.id))).go();
  }
}
