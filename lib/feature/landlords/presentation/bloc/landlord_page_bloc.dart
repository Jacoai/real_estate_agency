import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:real_estate_agency/feature/landlords/models/landlord.dart';
import 'package:real_estate_agency/main.dart';

part 'landlord_page_event.dart';
part 'landlord_page_state.dart';

class LandlordPageBloc extends Bloc<LandlordPageEvent, LandlordPageState> {
  LandlordPageBloc() : super(LandlordPageState()) {
    on<LandlordPageOpenedEvent>(_landlordPageOpenedEvent);
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
            ),
          )
          .watch(),
      onData: (data) => emit(state.copyWith(landlords: data)),
    );
  }
}
