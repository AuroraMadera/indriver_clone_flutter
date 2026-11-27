// se cambio para que se cumpla la condicion de que debe llevar el @ en email, 
//que debe tener mas de 6 caracteres la contraseña 
//que quiero que haga match cal momento de confirmar, 
// y el telefono sean numeros, no puede poner letras
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {

    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.trim().isEmpty
                ? 'Ingresa tu nombre'
                : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastnameChanged>((event, emit) {
      emit(
        state.copyWith(
          lastname: BlocFormItem(
            value: event.lastname.value,
            error: event.lastname.value.trim().isEmpty
                ? 'Ingresa tu apellido'
                : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.trim().isEmpty
                ? 'Ingresa tu correo electrónico'
                : !RegExp(
                    r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                  ).hasMatch(event.email.value.trim())
                    ? 'Ingresa un correo electrónico válido'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty
                ? 'Ingresa tu teléfono'
                : !RegExp(r'^[0-9]+$').hasMatch(event.phone.value)
                    ? 'El teléfono solo debe contener números'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      final password = event.password.value;

      emit(
        state.copyWith(
          password: BlocFormItem(
            value: password,
            error: password.isEmpty
                ? 'Ingresa tu contraseña'
                : password.length < 6
                    ? 'La contraseña debe tener mínimo 6 caracteres'
                    : null,
          ),
          confirmPassword: BlocFormItem(
            value: state.confirmPassword.value,
            error: state.confirmPassword.value.isEmpty
                ? 'Confirma tu contraseña'
                : state.confirmPassword.value.length < 6
                    ? 'La contraseña debe tener mínimo 6 caracteres'
                    : state.confirmPassword.value != password
                        ? 'Las contraseñas no coinciden'
                        : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<ConfirmPasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: BlocFormItem(
            value: event.confirmPassword.value,
            error: event.confirmPassword.value.isEmpty
                ? 'Confirma tu contraseña'
                : event.confirmPassword.value.length < 6
                    ? 'La contraseña debe tener mínimo 6 caracteres'
                    : event.confirmPassword.value != state.password.value
                        ? 'Las contraseñas no coinciden'
                        : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('LastName: ${state.lastname.value}');
      print('Email: ${state.email.value}');
      print('Phone: ${state.phone.value}');
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
