import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posui_pocket/core/extensiones/build_extensions.dart';
import 'package:flutter_posui_pocket/features/login/bloc/login_bloc.dart';
import 'package:flutter_posui_pocket/features/main_dashboard/presentation/main_dashboard_screen.dart';
import 'package:flutter_posui_pocket/ui/components/buttons/aplazo_button.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';
import 'package:flutter_posui_pocket/ui/components/loaders/aplazo_loader.dart';
import 'package:flutter_posui_pocket/ui/components/navigations/aplazo_navbar.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';

class LoginScreen extends StatefulWidget {
  static const idScreen = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
        child: BlocConsumer<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is! LoginLoading) {
            return Scaffold(
              appBar: AplazoNavbar(
                  navbarProps:
                  NavbarProps(title: 'Inicia sesión', isBackEnable: false)),
              body: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    AplazoText(
                        textProps: TextProps(
                            text: 'Bienvenido',
                            type: TextType.headlineSize32Weight700,
                            multiAligment: TextAlign.start,
                            aligment: Alignment.centerLeft,
                            paddingHorizontal: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    AplazoText(
                        textProps: TextProps(
                            text: 'Inicia sesión como comerciante',
                            type: TextType.headlineSize16Weight400,
                            multiAligment: TextAlign.start,
                            aligment: Alignment.centerLeft,
                            paddingHorizontal: 16)),
                    const SizedBox(
                      height: 8,
                    ),
                    AplazoTextField(
                        textFieldProps: TextFieldProps(
                              hintText: 'Usuario',
                              label: 'Ingresa tu usuario',
                              textFieldType: TextFieldType.email),
                        onChanged: (text) {},
                        controller: emailController),
                    const SizedBox(
                      height: 8,
                    ),
                    StatefulBuilder(builder: (context, state) {
                      return AplazoTextField(
                          textFieldProps: TextFieldProps(
                              hintText: 'Password',
                              showPassword: showPassword,
                              suffixCustomWidget: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                icon: Icon(showPassword
                                    ? Icons.remove_red_eye_rounded
                                    : Icons.add_circle_outline),
                              ),
                              isPassword: true,
                              label: 'Ingresa tu contraseña',
                              textFieldType: TextFieldType.normal),
                          onChanged: (text) {},
                          controller: passwordController);
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    AplazoButton(
                        buttonProps: ButtonProps(
                            text: 'Continuar', buttonType: ButtonType.primary),
                        onPressed: () {
                          BlocProvider.of<LoginBloc>(context).add(
                              UserLoginEvent(user: emailController.text,
                                  password: passwordController.text));
                        }),
                    const SizedBox(
                      height: 16,
                    ),
                    AplazoText(
                        textProps: TextProps(
                            text: 'OLVIDE MI CONTRASEÑA',
                            type: TextType.headlineSize16Weight700)),
                    const SizedBox(
                      height: 32,
                    ),
                    AplazoText(
                        textProps: TextProps(
                            text: '¿No tienes cuenta de comercio?',
                            type: TextType.headlineSize16Weight700)),
                    const SizedBox(
                      height: 16,
                    ),
                    AplazoButton(buttonProps: ButtonProps(
                        text: 'Crea tu cuenta comercial',
                        buttonType: ButtonType.secondary), onPressed: () {

                    })
                  ],
                ),
              ),
            );
          } else {
            return const AplazoLoader();
          }
          },
          listener: (context, state) {
            if (state is UserLogged) {
              context.materialPushAndRemoveUntil(
                  screen: const MainDashboardScreen());
            }
          },));
  }
}
