import 'package:cheflike/widgets/buttons/google_login_button.dart';
import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _showPassword = false;

  void onClickSuffixIcon (){
    setState(() {
      _showPassword = !_showPassword;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('어서오세요!', style: Theme.of(context).primaryTextTheme.titleLarge),
                const SizedBox(height: 12),
                Text("로그인 정보를 입력해주세요", style: Theme.of(context).textTheme.titleMedium
                  ,),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(

                    children: [
                      TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),

                          hintText: '이메일을 입력해주세요',
                          prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 12),
                              child: Image.asset('assets/images/Message.png', width: 24, height: 24,))
                        ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                      const SizedBox(height: 12),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                            hintText: '비밀번호',
                            prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 12),
                                child: Image.asset('assets/images/Lock.png', width: 24, height: 24,)),
                          suffixIcon: GestureDetector(
                            onTap: onClickSuffixIcon,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 12, right: 20),
                                child: Image.asset('assets/images/Show.png', width: 24, height: 24,)),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: !_showPassword,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Implement password recovery logic
                              },
                              child: const Text(
                                '비밀번호를 잊으셨나요?',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      PrimaryButton(onPressed: (){}, label: '로그인', width: double.infinity,),
                      const SizedBox(height: 20,),
                      GoogleLoginButton(onPressed: (){}, label: '구글 로그인', width: double.infinity,),
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('계정이 없으신가요?'),
                          const SizedBox(width: 8,),
                          TextButton(onPressed: (){}, child: Text('회원가입', style: Theme.of(context).primaryTextTheme.titleSmall,))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
