import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_agency/feature/landlords/presentation/bloc/landlord_page_bloc.dart';
import 'package:real_estate_agency/feature/landlords/presentation/widgets/organization_card.dart';

class LandlordPageView extends StatefulWidget {
  const LandlordPageView({super.key});

  @override
  State<LandlordPageView> createState() => _LandlordPageViewState();
}

class _LandlordPageViewState extends State<LandlordPageView> {
  final _bloc = LandlordPageBloc();
  final nameColtroller = TextEditingController();
  final phoneColtroller = TextEditingController();
  final emailColtroller = TextEditingController();
  final adressColtroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc..add(LandlordPageOpenedEvent()),
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
                            controller: nameColtroller,
                            decoration: InputDecoration(hint: Text("ФИО")),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: TextField(
                            controller: phoneColtroller,
                            decoration: InputDecoration(hint: Text("Телефон")),
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
                            controller: emailColtroller,
                            decoration: InputDecoration(hint: Text("Email")),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.45,
                          child: TextField(
                            controller: adressColtroller,
                            decoration: InputDecoration(hint: Text("Адрес")),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _bloc.add(
                        AddLandlordEvent(
                          email: emailColtroller.text,
                          name: nameColtroller.text,
                          phone: phoneColtroller.text,
                          adress: adressColtroller.text,
                        ),
                      ),
                      child: Text("Добавить арендодателя"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<LandlordPageBloc, LandlordPageState>(
                  builder: (context, state) => Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      for (int i = 0; i < state.landlords.length; i++)
                        OrganizationCard(
                          id: state.landlords[i].id,
                          name: state.landlords[i].name,
                          email: state.landlords[i].email,
                          phone: state.landlords[i].phone,
                          adress: state.landlords[i].adress,
                          onDelete: ({required id}) =>
                              _bloc.add(DeleteLandlordEvent(id: id)),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
