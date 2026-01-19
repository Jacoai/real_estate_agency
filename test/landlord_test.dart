import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:drift/native.dart';
import 'package:real_estate_agency/core/database/database.dart';

import 'package:real_estate_agency/feature/landlords/presentation/bloc/landlord_page_bloc.dart';
import 'package:real_estate_agency/main.dart';

void main() {
  late LocalDatabase testDatabase;
  late LandlordPageBloc bloc;

  setUp(() {
    testDatabase = LocalDatabase.test(NativeDatabase.memory());
    database = testDatabase;
    bloc = LandlordPageBloc();
  });

  tearDown(() async {
    await database.close();
  });

  test('Список при инициализации пустой', () {
    expect(bloc.state.landlords, []);
  });

  blocTest<LandlordPageBloc, LandlordPageState>(
    'Добавление 1 арендодателя',
    build: () => bloc,
    act: (bloc) async {
      bloc.add(
        AddLandlordEvent(
          name: 'ООО Рога и Копыта',
          phone: '1234567890',
          email: 'test@mail.com',
          adress: 'ул. Ленина, 1',
        ),
      );
      bloc.add(LandlordPageOpenedEvent());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      isA<LandlordPageState>().having((s) => s.landlords.length, 'length', 1),
    ],
  );

  blocTest<LandlordPageBloc, LandlordPageState>(
    'Удаление по id',
    build: () => bloc,
    setUp: () async {
      await database.delete(database.landlordTable).go();
    },
    act: (bloc) async {
      const id = 'test-id';

      await database
          .into(database.landlordTable)
          .insert(
            LandlordTableCompanion.insert(
              id: id,
              name: 'ООО Рога и Копыта',
              phone: '1234567890',
              email: 'test@mail.com',
              adress: const Value('ул. Ленина, 1'),
            ),
          );

      bloc.add(LandlordPageOpenedEvent());
      bloc.add(DeleteLandlordEvent(id: id));
    },
    wait: const Duration(milliseconds: 150),
    verify: (bloc) {
      expect(bloc.state.landlords, isEmpty);
    },
  );

  blocTest<LandlordPageBloc, LandlordPageState>(
    'Добавление несольких арендателей',
    build: () => bloc,
    act: (bloc) async {
      await database
          .into(database.landlordTable)
          .insert(
            LandlordTableCompanion.insert(
              id: 'id1',
              name: 'Landlord 1',
              phone: '111',
              email: '1@mail.com',
              adress: Value('Address 1'),
            ),
          );
      await database
          .into(database.landlordTable)
          .insert(
            LandlordTableCompanion.insert(
              id: 'id2',
              name: 'Landlord 2',
              phone: '222',
              email: '2@mail.com',
              adress: Value('Address 2'),
            ),
          );

      bloc.add(LandlordPageOpenedEvent());
    },
    wait: const Duration(milliseconds: 100),
    expect: () => [
      isA<LandlordPageState>().having((s) => s.landlords.length, 'length', 2),
    ],
  );
}
