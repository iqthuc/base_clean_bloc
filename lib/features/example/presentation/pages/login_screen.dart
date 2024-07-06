import 'package:auto_route/auto_route.dart';
import 'package:base_clean_bloc/base/base_widget.dart';
import 'package:base_clean_bloc/common/index.dart';
import 'package:base_clean_bloc/di/di_setup.dart';
import 'package:base_clean_bloc/features/example/presentation/bloc/example_bloc.dart';
import 'package:base_clean_bloc/gen/assets.gen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, ExampleEvent, ExampleState, ExampleBloc> {
  final GlobalKey _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    final notificationPlugin = getIt.get<LocalNotificationHelper>();
    notificationPlugin.showNotification(title: "title", body: "body");
  }

  @override
  Widget renderUI(BuildContext context) {
    return BaseScaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: context.themeColors.myGreenColors,
      body: Form(
        key: _key,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              image: DecorationImage(image: Assets.images.background.provider(), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 50, top: 100),
                    alignment: Alignment.center,
                    child: Assets.images.background.image()),
                const Text(
                  'Email',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        contentPadding: const EdgeInsets.only(left: 20),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffD93C9E)),
                            borderRadius: BorderRadius.circular(50)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(50)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffD93C9E)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: false,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () {
                            // controller.show.value = !controller.show.value;
                          },
                          child: const Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.grey, height: 1),
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffD93C9E)),
                            borderRadius: BorderRadius.circular(50)),
                        errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(50)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffD93C9E)),
                            borderRadius: BorderRadius.circular(50)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(50))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3)),
                      child: Checkbox(
                          side: const BorderSide(color: Colors.transparent),
                          checkColor: Colors.black,
                          activeColor: Colors.transparent,
                          fillColor: WidgetStateProperty.all(Colors.white),
                          value: true,
                          onChanged: (value) {
                            // controller.saveCheckStay(value!);
                          }),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text('Stay singed in'),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                                onTap: () {
                                  // Get.to(() => ForgotPasswordScreen());
                                },
                                child: const Text('Forgot password?'))))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 0, top: 10),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        // controller.login();
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: const Color(0xffD93C9E),
                          shape: const StadiumBorder()),
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 0, top: 0),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                      onPressed: () {
                        // Get.to(SignUpScreen());
                      },
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.transparent,
                          shape: const StadiumBorder(),
                          side: const BorderSide(color: Color(0xffD93C9E))),
                      child: const Text(
                        "CREATE NEW ACCOUNT",
                        style: TextStyle(color: Color(0xffD93C9E), fontWeight: FontWeight.w900),
                      )),
                ),
                Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        // LoginAsGuestDialog.showDialogCode(context, controller);
                      },
                      child: const Text(
                        'Continue As Guest',
                        style: TextStyle(
                            color: Color(0xffD93C9E),
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign in with Facebook, Google',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.blue.shade900)),
                      child: Assets.images.facebookIcon.image(),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.red)),
                      child: Assets.images.googleIcon.image(),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
