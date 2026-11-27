
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:indriver_clone_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:indriver_clone_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:indriver_clone_flutter/src/presentation/widgets/DefaultTextFieldOutlined.dart';

class RegisterContent extends StatelessWidget {
  final RegisterState state;

  const RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(left: 12),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 12, 38, 145),
                Color.fromARGB(255, 34, 156, 249),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(context),
              const SizedBox(height: 100),
              _textRegisterRotated(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ],
          ),
        ),

        Positioned.fill(
          left: 60,
          bottom: 35,
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 15, 45, 130),
                  Color.fromARGB(255, 25, 115, 225),
                ],
              ),
            ),
            child: Stack(
              children: [
                IgnorePointer(
                  child: _imageBackground(context),
                ),

                SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      _imageBanner(),

                      DefaultTextFieldOutlined(
                        text: 'Nombre',
                        icon: Icons.person_outline,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            NameChanged(
                              name: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.name.error;
                        },
                      ),

                      DefaultTextFieldOutlined(
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            LastnameChanged(
                              lastname: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.lastname.error;
                        },
                      ),

                      DefaultTextFieldOutlined(
                        text: 'Email',
                        icon: Icons.email_outlined,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            EmailChanged(
                              email: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.email.error;
                        },
                      ),

                      DefaultTextFieldOutlined(
                        text: 'Phone',
                        icon: Icons.phone_outlined,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            PhoneChanged(
                              phone: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.phone.error;
                        },
                      ),

                      DefaultTextFieldOutlined(
                        text: 'Password',
                        icon: Icons.lock_outlined,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            PasswordChanged(
                              password: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.password.error;
                        },
                      ),

                      DefaultTextFieldOutlined(
                        text: 'Confirm Password',
                        icon: Icons.lock_outlined,
                        margin: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 15,
                        ),
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            ConfirmPasswordChanged(
                              confirmPassword: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return state.confirmPassword.error;
                        },
                      ),

                      DefaultButton(
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmit());
                            context.read<RegisterBloc>().add(FormReset());
                          }
                        },
                        text: 'Crear usuario',
                        margin: const EdgeInsets.only(
                          left: 60,
                          right: 60,
                          top: 35,
                        ),
                      ),

                      const SizedBox(height: 25),

                      _separatorOr(),

                      const SizedBox(height: 15),

                      _textIAlreadyHaveAccount(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: const AlwaysStoppedAnimation<double>(0.3),
      ),
    );
  }

  Widget _textIAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿Ya tienes cuenta? ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),

        const SizedBox(width: 5),

        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
          child: const Text(
            'Inicia Sesión',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(right: 5),
        ),

        const Text(
          'O',
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),

        Container(
          width: 25,
          height: 1,
          color: Colors.white,
          margin: const EdgeInsets.only(left: 5),
        ),
      ],
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/trip.png',
        width: 180,
        height: 180,
      ),
    );
  }

  Widget _textRegisterRotated() {
    return const RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Register',
        style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textLoginRotated(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'login');
      },
      child: const RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
