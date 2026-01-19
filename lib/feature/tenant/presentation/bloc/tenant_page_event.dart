part of 'tenant_page_bloc.dart';

sealed class TenantPageEvent {}

class TenantPageOpenedEvent extends TenantPageEvent {}

class AddTenantEvent extends TenantPageEvent {
  final String name;
  final String phone;
  final String email;
  final String adress;
  AddTenantEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.adress,
  });
}

class DeleteTenantEvent extends TenantPageEvent {
  final String id;
  DeleteTenantEvent({required this.id});
}
