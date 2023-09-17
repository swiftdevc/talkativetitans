import 'package:flutter/material.dart';
import 'package:talkativetitans/constants/project_paddings.dart';
import 'package:talkativetitans/constants/project_strings.dart';
import 'package:lottie/lottie.dart';
import 'package:talkativetitans/ui/auth/sign_in_view.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectString.appName, style: const TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: false,
      ),
      body: Padding(
        padding: ProjectPadding.pagePadding,
        child: Column(
          children: [
            Container(child: Lottie.asset("assets/animations/lottie/onboard.json")),
            const _EmptyBox(),
            Text(
              ProjectString.onboardWelcome,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, fontWeight: FontWeight.bold),
            ),
            const _EmptyBox(),
            Text(
              ProjectString.onboardMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w500),
            ),
            const _EmptyBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  buttonBGColor: Colors.blue[900]!,
                  buttonFGColor: Colors.white,
                  buttonTextString: ProjectString.appSignIn,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const SignInView()));
                    setState(() {});
                  },
                ),
                CustomButton(
                  buttonBGColor: Colors.white,
                  buttonFGColor: Colors.black,
                  buttonTextString: ProjectString.appSignUp,
                ),
              ],
            ),
            const _EmptyBox(),
            const _EmptyBox(),
            Text(
              ProjectString.onboardSocialAuth,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: Theme.of(context).textTheme.titleMedium?.fontSize),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_CustomSocialAuthButton(), _CustomSocialAuthButton()],
            )
          ],
        ),
      ),
    );
  }

  IconButton _CustomSocialAuthButton() => IconButton(
        onPressed: () {},
        icon: const Icon(Icons.facebook_outlined),
        iconSize: 24.0,
        color: Colors.blue,
      );
}

class _EmptyBox extends StatelessWidget {
  const _EmptyBox();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
