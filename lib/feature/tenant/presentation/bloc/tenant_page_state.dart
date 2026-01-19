part of 'tenant_page_bloc.dart';

class TenantPageState {
  List<Tenant> tenants;

  TenantPageState({this.tenants = const []});

  TenantPageState copyWith({List<Tenant>? tenants}) {
    return TenantPageState(tenants: tenants ?? this.tenants);
  }
}
