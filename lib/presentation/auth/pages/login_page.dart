import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/icons.dart';
import '../../home/pages/home_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hello",
                    children: [
                      TextSpan(
                        text: "\nAgain!",
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                      color: kTitleActiveColor,
                    ),
                  ),
                ),
                const Gap(4),
                Text(
                  "Welcome back you’ve\nbeen missed",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: kBodyTextColor,
                  ),
                ),
                const Gap(48),
                RichText(
                  text: TextSpan(
                    text: "Username",
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(color: kErrorDarkColor),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kBodyTextColor,
                    ),
                  ),
                ),
                const Gap(4),
                CupertinoTextField(
                  controller: _usernameController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  padding: const EdgeInsets.all(15),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kTitleActiveColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: kBodyTextColor,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const Gap(16),
                RichText(
                  text: TextSpan(
                    text: "Password",
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(color: kErrorDarkColor),
                      ),
                    ],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kBodyTextColor,
                    ),
                  ),
                ),
                const Gap(4),
                CupertinoTextField(
                  controller: _passwordController,
                  maxLines: 1,
                  obscureText: _passwordObscure,
                  keyboardType: TextInputType.visiblePassword,
                  padding: const EdgeInsets.all(15),
                  suffix: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CupertinoButton(
                      onPressed: () {
                        setState(() {
                          _passwordObscure = !_passwordObscure;
                        });
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: SvgPicture.asset(
                        _passwordObscure ? kIcHidePassword : kIcShowPassword,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kTitleActiveColor,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: kBodyTextColor,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Text(
                        "Forgot the password ?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(18),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    onPressed: () {
                      Navigator.of(context).pushNamed(HomePage.routeName);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "or continue with",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kBodyTextColor,
                    ),
                  ),
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: CupertinoButton(
                        onPressed: () {},
                        color: kSecondaryButtonColor,
                        minSize: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        borderRadius: BorderRadius.circular(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(kIcFacebook),
                            const Gap(10),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: kButtonTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(31),
                    Expanded(
                      child: CupertinoButton(
                        onPressed: () {},
                        color: kSecondaryButtonColor,
                        minSize: 0,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        borderRadius: BorderRadius.circular(6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(kIcGoogle),
                            const Gap(10),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: kButtonTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don’t have an account ? ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: kBodyTextColor,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignupPage.routeName);
                      },
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
