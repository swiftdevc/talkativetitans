import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talkativetitans/constants/project_colors.dart';
import 'package:talkativetitans/constants/project_paddings.dart';
import 'package:talkativetitans/constants/project_strings.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:talkativetitans/core/router/app_router.dart';
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
            Container(child: Lottie.asset("assets/animations/lottie/onboardLottie.json")),
            const _EmptyBox(),
            Text(
              'Welcome Titan!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, fontWeight: FontWeight.bold),
            ),
            const _EmptyBox(),
            Text(
              "onboard_lang_text",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ).tr(),
            const _EmptyBox(),
            Text(
              "onboard_lang_tutor_text",
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: Theme.of(context).textTheme.titleLarge?.fontSize, fontWeight: FontWeight.bold),
            ).tr(),
            const _EmptyBox(),
            const _EmptyBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  buttonBGColor: ProjectColor.black,
                  buttonFGColor: ProjectColor.white,
                  buttonTextString: 'sign_in_text'.tr(),
                  onPressed: () {
                    context.go('/signin');
                  },
                ),
                CustomButton(
                  buttonBGColor: Colors.white,
                  buttonFGColor: Colors.black,
                  buttonTextString: 'sign_up_text'.tr(),
                  onPressed: () {
                    context.go('/signup');
                  },
                ),
              ],
            ),
            const _EmptyBox(),
            const _EmptyBox(),
          ],
        ),
      ),
    );
  }

  IconButton _customSocialAuthButton() => IconButton(
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
