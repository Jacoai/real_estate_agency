import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_agency/feature/landlords/presentation/widgets/organization_card.dart';
import 'package:real_estate_agency/feature/tenant/presentation/bloc/tenant_page_bloc.dart';

class TenantPageView extends StatefulWidget {
  const TenantPageView({super.key});

  @override
  State<TenantPageView> createState() => _TenantPageViewState();
}

class _TenantPageViewState extends State<TenantPageView> {
  final _bloc = TenantPageBloc();
  final nameColtroller = TextEditingController();
  final phoneColtroller = TextEditingController();
  final emailColtroller = TextEditingController();
  final adressColtroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BlocProvider(
        create: (context) => _bloc..add(TenantPageOpenedEvent()),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.purpleAccent, width: 2),
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
                        AddTenantEvent(
                          email: emailColtroller.text,
                          name: nameColtroller.text,
                          phone: phoneColtroller.text,
                          adress: adressColtroller.text,
                        ),
                      ),
                      child: Text("Добавить арендатора"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<TenantPageBloc, TenantPageState>(
                  builder: (context, state) => Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      for (int i = 0; i < state.tenants.length; i++)
                        OrganizationCard(
                          id: state.tenants[i].id,
                          name: state.tenants[i].name,
                          email: state.tenants[i].email,
                          phone: state.tenants[i].phone,
                          adress: state.tenants[i].adress,
                          onDelete: ({required id}) =>
                              _bloc.add(DeleteTenantEvent(id: id)),
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
