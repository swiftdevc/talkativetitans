import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:talkativetitans/constants/project_strings.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectString.appName),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left_outlined)),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Lottie.asset("assets/animations/lottie/lang.json"),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: CustomTextFormFieldWidget(
                      textFormFieldPrefixIcon: Icon(Icons.email_outlined), hintText: 'Your e-mail')),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: CustomTextFormFieldWidget(
                  textFormFieldPrefixIcon: Icon(Icons.lock_outline),
                  textFormFieldSuffixIcon: Icon(Icons.remove_red_eye_outlined),
                  hintText: 'Your Password',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: CustomButton(
                  buttonBGColor: Colors.tealAccent,
                  buttonFGColor: Colors.white,
                  buttonTextString: ProjectString.appName,
                ),
              )
            ],
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
        maximumSize: const MaterialStatePropertyAll(Size.infinite),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Text(buttonTextString),
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
          prefixIcon: textFormFieldPrefixIcon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          suffixIcon: textFormFieldSuffixIcon ?? const SizedBox.shrink()),
    );
  }
}
