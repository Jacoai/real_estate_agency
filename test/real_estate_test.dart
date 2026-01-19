import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:real_estate_agency/core/database/database.dart';

import 'package:real_estate_agency/feature/real_estate/presentation/bloc/real_estate_page_bloc.dart';
import 'package:real_estate_agency/main.dart';

void main() {
  late LocalDatabase testDatabase;
  late RealEstatePageBloc bloc;

  setUp(() async {
    testDatabase = LocalDatabase.test(NativeDatabase.memory());
    database = testDatabase;
    bloc = RealEstatePageBloc();

    await database.delete(database.realEstateTable).go();
    await database.delete(database.landlordTable).go();
  });

  tearDown(() async {
    await testDatabase.close();
  });

  test('При инициализации списки пустые', () {
    expect(bloc.state.realEstates, isEmpty);
    expect(bloc.state.landlords, isEmpty);
  });

  blocTest<RealEstatePageBloc, RealEstatePageState>(
    'Рагрузить недвижимость при открытии страницы',
    build: () => bloc,
    act: (bloc) async {
      await database
          .into(database.realEstateTable)
          .insert(
            RealEstateTableCompanion.insert(
              id: 're1',
              title: 'Офис',
              address: 'ул. Ленина, 1',
              area: 50,
              status: 'Свободен',
              type: 'Офис',
              landlordId: 'l1',
            ),
          );

      bloc.add(RealEstatePageOpenedEvent());
    },
    wait: const Duration(milliseconds: 150),
    verify: (bloc) {
      expect(bloc.state.realEstates.length, 1);
      expect(bloc.state.realEstates.first.title, 'Офис');
    },
  );

  blocTest<RealEstatePageBloc, RealEstatePageState>(
    'Добавить недвижимость',
    build: () => bloc,
    act: (bloc) async {
      bloc.add(
        AddRealEstateEvent(
          title: 'Квартира',
          address: 'ул. Пушкина, 10',
          area: 40,
          status: 'Свободен',
          type: 'Жилая',
          landlordId: 'l1',
        ),
      );

      bloc.add(RealEstatePageOpenedEvent());
    },
    wait: const Duration(milliseconds: 150),
    verify: (bloc) {
      expect(bloc.state.realEstates.length, 1);
      expect(bloc.state.realEstates.first.type, 'Жилая');
    },
  );

  blocTest<RealEstatePageBloc, RealEstatePageState>(
    'Удалить недвижимость',
    build: () => bloc,
    act: (bloc) async {
      const id = 're-delete';

      await database
          .into(database.realEstateTable)
          .insert(
            RealEstateTableCompanion.insert(
              id: id,
              title: 'Склад',
              address: 'ул. Мира, 5',
              area: 120,
              status: 'Свободен',
              type: 'Склад',
              landlordId: 'l1',
            ),
          );

      bloc.add(RealEstatePageOpenedEvent());
      bloc.add(DeleteRealEstateEvent(id: id));
    },
    wait: const Duration(milliseconds: 150),
    verify: (bloc) {
      expect(bloc.state.realEstates, isEmpty);
    },
  );

  blocTest<RealEstatePageBloc, RealEstatePageState>(
    'Поток недвижимости',
    build: () => bloc,
    act: (bloc) async {
      await database
          .into(database.landlordTable)
          .insert(
            LandlordTableCompanion.insert(
              id: 'l1',
              name: 'ООО Арендодатель',
              phone: '123456789',
              email: 'landlord@mail.com',
              adress: const Value('ул. Ленина, 1'),
            ),
          );

      bloc.add(StreamLandlordsEvent());
    },
    wait: const Duration(milliseconds: 150),
    verify: (bloc) {
      expect(bloc.state.landlords.length, 1);
      expect(bloc.state.landlords.first.name, 'ООО Арендодатель');
    },
  );
}
