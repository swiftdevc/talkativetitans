import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talkativetitans/constants/project_paddings.dart';
import 'package:talkativetitans/constants/project_strings.dart';
import 'package:talkativetitans/ui/auth/onboard_view.dart';
import 'package:talkativetitans/ui/auth/sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.chevron_left_outlined)),
        title: Text(ProjectString.appName),
      ),
      body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {},
          child: Padding(
            padding: ProjectPadding.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  ProjectString.appSignUp,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  decoration: const InputDecoration(hintText: 'name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: FormFieldValidator().isNotEmpty,
                  decoration: const InputDecoration(hintText: 'Password again'),
                ),
                const SizedBox(
                  height: 3,
                ),
                Checkbox(value: true, onChanged: (value) {}),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                    buttonFGColor: Colors.white, buttonBGColor: Colors.black, buttonTextString: ProjectString.appSignUp)
              ],
            ),
          )),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = "You can't leave it alone!";
}
