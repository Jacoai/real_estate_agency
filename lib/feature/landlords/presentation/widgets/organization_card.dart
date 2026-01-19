import 'package:flutter/material.dart';

class OrganizationCard extends StatefulWidget {
  const OrganizationCard({
    super.key,
    required this.name,
    required this.id,
    required this.email,
    required this.phone,
    required this.onDelete,
    this.adress,
  });

  final String id;
  final String name;
  final String phone;
  final String email;
  final String? adress;

  final Function({required String id}) onDelete;

  @override
  State<OrganizationCard> createState() => _OrganizationCardState();
}

class _OrganizationCardState extends State<OrganizationCard> {
  @override
  Widget build(BuildContext context) {
    double widthCard = MediaQuery.of(context).size.width * 0.4;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.indigo, width: 2),
      ),
      padding: EdgeInsets.only(left: 16),
      width: widthCard,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ФИО: ${widget.name}"),
                Text("Номер: ${widget.phone}"),
                Text("Email: ${widget.email}"),
                Text("Адрес: ${widget.adress ?? 'не указан'}"),
              ],
            ),
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  widget.onDelete(id: widget.id);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
