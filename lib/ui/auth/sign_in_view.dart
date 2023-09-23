import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:talkativetitans/constants/project_strings.dart';
import 'package:easy_localization/easy_localization.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectString.appName),
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.chevron_left_outlined)),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Welcome back! login with the data that you entered during registration.'),
                const SizedBox(
                  height: 20,
                ),
                const Text('Email'),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: CustomTextFormFieldWidget(
                        textFormFieldPrefixIcon: Icon(Icons.email_outlined), hintText: 'Your e-mail')),
                const SizedBox(
                  height: 20,
                ),
                const Text('Password'),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CustomTextFormFieldWidget(
                    textFormFieldPrefixIcon: Icon(Icons.lock_outline),
                    textFormFieldSuffixIcon: Icon(Icons.remove_red_eye_outlined),
                    hintText: 'Your Password',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = !isChecked;
                              setState(() {});
                            }),
                        const Text("Remember me!")
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'sign_in_forgot_pass',
                          style: TextStyle(color: Colors.blueGrey[900], decoration: TextDecoration.underline),
                        ).tr())
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text('Or')),
                    Expanded(child: Divider())
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.facebook_outlined)),
                    IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.account_circle_sharp)),
                    IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.account_circle_outlined)),
                  ],
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: CustomButton(
                    buttonBGColor: Colors.black,
                    buttonFGColor: Colors.white,
                    buttonTextString: ProjectString.appSignIn,
                    onPressed: () => context.go('/home'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blueGrey[900], decoration: TextDecoration.underline),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonFGColor,
    required this.buttonBGColor,
    required this.buttonTextString,
    this.onPressed,
  });

  final Color buttonFGColor;
  final Color buttonBGColor;
  final String buttonTextString;

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(buttonBGColor),
        foregroundColor: MaterialStatePropertyAll(buttonFGColor),
        minimumSize: const MaterialStatePropertyAll(Size(120.0, 50.0)),
        maximumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width * 0.9, 50.0)),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Text(buttonTextString).tr(),
    );
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.textFormFieldPrefixIcon,
    required this.hintText,
    this.textFormFieldSuffixIcon,
  });

  final Icon textFormFieldPrefixIcon;
  final Icon? textFormFieldSuffixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: Colors.grey[100],
          filled: true,
          prefixIcon: textFormFieldPrefixIcon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          suffixIcon: textFormFieldSuffixIcon ?? const SizedBox.shrink()),
    );
  }
}
