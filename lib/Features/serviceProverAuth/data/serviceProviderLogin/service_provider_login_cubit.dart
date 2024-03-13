import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_provider_login_state.dart';
part 'service_provider_login_cubit.freezed.dart';

class ServiceProviderLoginCubit extends Cubit<ServiceProviderLoginState> {
  ServiceProviderLoginCubit()
      : super(const ServiceProviderLoginState.initial());
}
