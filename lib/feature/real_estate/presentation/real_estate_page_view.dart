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
  final TextEditingController titleColtroller = TextEditingController();
  final TextEditingController addressColtroller = TextEditingController();
  final TextEditingController typeColtroller = TextEditingController();
  final TextEditingController areaColtroller = TextEditingController();
  final TextEditingController statusColtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc..add(RealEstatePageOpenedEvent()),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
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
                            decoration: InputDecoration(hint: Text("Адрес")),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: TextField(
                            controller: typeColtroller,
                            decoration: InputDecoration(
                              hint: Text("Тип недвижимости"),
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
                            decoration: InputDecoration(hint: Text("Статус")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      //_bloc.add(
                      // AddLandlordEvent(
                      //   email: emailColtroller.text,
                      //   name: nameColtroller.text,
                      //   phone: phoneColtroller.text,
                      //   adress: adressColtroller.text,
                      // ),
                      //),
                      child: Text("Добавить арендодателя"),
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
                      // for (
                      //   int i = 0;
                      //   i < state
                      //     ..length;
                      //   i++
                      // )
                      //   OrganizationCard(
                      //     id: state.landlords[i].id,
                      //     name: state.landlords[i].name,
                      //     email: state.landlords[i].email,
                      //     phone: state.landlords[i].phone,
                      //     adress: state.landlords[i].adress,
                      //     onDelete: ({required id}) =>
                      //         _bloc.add(DeleteLandlordEvent(id: id)),
                      //   ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
