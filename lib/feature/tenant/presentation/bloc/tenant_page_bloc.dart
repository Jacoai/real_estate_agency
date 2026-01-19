import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:real_estate_agency/core/database/database.dart';
import 'package:real_estate_agency/feature/tenant/models/tenent.dart';
import 'package:real_estate_agency/main.dart';
import 'package:uuid/uuid.dart';

part 'tenant_page_event.dart';
part 'tenant_page_state.dart';

class TenantPageBloc extends Bloc<TenantPageEvent, TenantPageState> {
  Uuid uuid = Uuid();
  TenantPageBloc() : super(TenantPageState()) {
    on<TenantPageOpenedEvent>(_tenantPageOpenedEvent);
    on<AddTenantEvent>(_addTenantEvent);
    on<DeleteTenantEvent>(_deleteTenantEvent);
  }

  FutureOr<void> _tenantPageOpenedEvent(
    TenantPageOpenedEvent event,
    Emitter<TenantPageState> emit,
  ) async {
    await emit.onEach(
      database
          .select(database.tenantTable)
          .map(
            (row) => Tenant(
              id: row.id,
              name: row.name,
              phone: row.phone,
              email: row.email,
              adress: row.address,
            ),
          )
          .watch(),
      onData: (data) => emit(state.copyWith(tenants: data)),
    );
  }

  FutureOr<void> _addTenantEvent(
    AddTenantEvent event,
    Emitter<TenantPageState> emit,
  ) async {
    await database
        .into(database.tenantTable)
        .insert(
          TenantTableCompanion.insert(
            id: uuid.v1(),
            name: event.name,
            phone: event.phone,
            email: event.email,
            address: event.adress,
          ),
        );
  }

  FutureOr<void> _deleteTenantEvent(
    DeleteTenantEvent event,
    Emitter<TenantPageState> emit,
  ) async {
    await (database.delete(
      database.tenantTable,
    )..where((tbl) => tbl.id.equals(event.id))).go();
  }
}
