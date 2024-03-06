import 'package:cheflike/widgets/buttons/google_login_button.dart';
import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class PasswordRecoveryPage extends StatefulWidget {
  const PasswordRecoveryPage({super.key});

  @override
  State<PasswordRecoveryPage> createState() => _PasswordRecoveryPageState();
}

class _PasswordRecoveryPageState extends State<PasswordRecoveryPage> {


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
                Text('비밀번호 찾기', style: Theme.of(context).primaryTextTheme.titleLarge),
                const SizedBox(height: 12),
                Text("인증메일 전송을 위해 이메일을 입력해주세요", style: Theme.of(context).textTheme.titleMedium
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
                      const SizedBox(height: 40),
                      PrimaryButton(onPressed: (){}, label: '로그인', width: double.infinity,),
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
