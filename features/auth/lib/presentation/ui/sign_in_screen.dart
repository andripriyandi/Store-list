import 'package:auth/presentation/bloc/login_bloc.dart';
import 'package:component/theme/theme.dart';
import 'package:data/models/request/auth/login_request.dart';
import 'package:dependencies/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:component/widgets/background/bg.dart';
import 'package:component/widgets/button/button_primary.dart';
import 'package:component/widgets/textfield/custom_input_text.dart';
import 'package:stores/presentation/ui/stores_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;

  void _submitLogin() {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      LoginRequest request = LoginRequest(
        username: _usernameController.text,
        password: _passwordController.text,
      );
      context.read<LoginBloc>().add(LoginProcessEvent(request: request));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Isi Username dan Password terlebih dahulu"),
            backgroundColor: Colors.red),
      );
    }
  }

  Widget _formLogin(LoginState state) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomInputText(
            hintText: "Username",
            preffixWidget: Icon(
              Icons.people,
              color: kPrimaryColor,
            ),
            controller: _usernameController,
          ),
          const SizedBox(height: 30),
          CustomInputText(
            hintText: "Password",
            preffixWidget: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            controller: _passwordController,
            passwordMode: true,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      side: MaterialStateBorderSide.resolveWith((states) =>
                          BorderSide(width: 2, color: kPrimaryColor)),
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChecked = value!;
                          },
                        );
                      },
                    ),
                    Text(
                      "Keep Username",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.download,
                      color: kPrimaryColor,
                      size: 18,
                    ),
                    Text(
                      "Check Update",
                      style: primaryTextStyle.copyWith(
                          fontSize: 14, fontWeight: semibold),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ButtonPrimary(
              title: "LOGIN",
              isLoading: state.status == LoginStatus.loading,
              onTap: () {
                _submitLogin();
              },
            ),
          ),
          Text(
            "App Ver 1.0.0 - 20013FEA6BCC820C",
            style: greyTextStyle.copyWith(fontSize: 14, fontWeight: medium),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const Background(),
              _formLogin(state),
            ],
          ),
        );
      },
    );
  }
}
