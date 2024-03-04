import 'package:cheflike/pages/sign_in.dart';
import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Onboarding.png'),
          const SizedBox(
            height: 12,
          ),
          Text("요리 시작하기", style: Theme.of(context).primaryTextTheme.titleLarge),
          const SizedBox(
            height: 12,
          ),
          Text("쉐프의 커뮤니티에 들어오셔서\n더 나은 요리를 만들어 보세요",
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(
            height: 40,
          ),
          PrimaryButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignInPage())),
            label: "시작하기",
          )
        ],
      ),
    );
  }
}
