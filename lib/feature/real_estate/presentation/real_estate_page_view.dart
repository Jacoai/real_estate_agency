import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_agency/feature/real_estate/presentation/bloc/real_estate_page_bloc.dart';

class RealEstatePageView extends StatefulWidget {
  const RealEstatePageView({super.key});

  @override
  State<RealEstatePageView> createState() => _RealEstatePageViewState();
}

class _RealEstatePageViewState extends State<RealEstatePageView> {
  final _bloc = RealEstatePageBloc();
  final titleColtroller = TextEditingController();
  final addressColtroller = TextEditingController();
  final typeColtroller = TextEditingController();
  final areaColtroller = TextEditingController();
  final statusColtroller = TextEditingController();

  final landlordColtroller = TextEditingController();
  String? selectedLandlord;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc
          ..add(RealEstatePageOpenedEvent())
          ..add(StreamLandlordsEvent()),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: BlocBuilder<RealEstatePageBloc, RealEstatePageState>(
            builder: (context, state) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lightBlue, width: 2),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.45,
                              child: TextField(
                                controller: titleColtroller,
                                decoration: InputDecoration(
                                  hint: Text("Название недвижимости"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.45,
                              child: TextField(
                                controller: addressColtroller,
                                decoration: InputDecoration(
                                  hint: Text("Адрес"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.45,
                              child: TextField(
                                controller: areaColtroller,
                                decoration: InputDecoration(
                                  hint: Text("Площадь м^2"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.45,
                              child: TextField(
                                controller: statusColtroller,
                                decoration: InputDecoration(
                                  hint: Text("Статус"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.45,
                              child: TextField(
                                controller: typeColtroller,
                                decoration: InputDecoration(
                                  hint: Text("Тип недвижимости"),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 14),
                                alignment: AlignmentGeometry.center,
                                child: DropdownMenu<String>(
                                  controller: landlordColtroller,
                                  enableFilter: true,
                                  requestFocusOnTap: true,
                                  leadingIcon: const Icon(Icons.search),
                                  label: const Text('Арендодатель'),
                                  dropdownMenuEntries: [
                                    for (
                                      int i = 0;
                                      i < state.landlords.length;
                                      i++
                                    )
                                      DropdownMenuEntry(
                                        value: state.landlords[i].id,
                                        label: state.landlords[i].name,
                                      ),
                                  ],

                                  onSelected: (value) =>
                                      setState(() => selectedLandlord = value),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => _bloc.add(
                            AddRealEstateEvent(
                              address: addressColtroller.text,
                              area: double.tryParse(areaColtroller.text) ?? 0.0,
                              status: statusColtroller.text,
                              title: titleColtroller.text,
                              type: typeColtroller.text,
                              landlordId: selectedLandlord!,
                            ),
                          ),

                          child: Text("Добавить недвижимость"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<RealEstatePageBloc, RealEstatePageState>(
                      builder: (context, state) => Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: [
                          for (int i = 0; i < state.realEstates.length; i++)
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black38,
                                  width: 2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Название: ${state.realEstates[i].title}",
                                        ),
                                        Text(
                                          "Адресс: ${state.realEstates[i].address}",
                                        ),
                                        Text(
                                          "Тип: ${state.realEstates[i].type}",
                                        ),
                                        Text(
                                          "Площадь м^2: ${state.realEstates[i].area}",
                                        ),
                                        Text(
                                          "Статус: ${state.realEstates[i].status}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () => _bloc.add(
                                          DeleteRealEstateEvent(
                                            id: state.realEstates[i].id,
                                          ),
                                        ),
                                        icon: Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
