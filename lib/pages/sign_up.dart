import 'package:cheflike/widgets/buttons/google_login_button.dart';
import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('어서오세요!', style: Theme.of(context).primaryTextTheme.titleLarge),
                const SizedBox(height: 12),
                Text("회원가입 정보를 입력해주세요", style: Theme.of(context).textTheme.titleMedium
                  ,),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(

                    children: [
                      TextField(
                        style: Theme.of(context).primaryTextTheme.titleMedium,
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
                        style: Theme.of(context).primaryTextTheme.titleMedium,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('비밀번호는 : ', style: Theme.of(context).primaryTextTheme.titleMedium,),
                            const SizedBox(height: 12,),
                            Row(
                              children: [
                                CircleAvatar(radius: 12, backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2), child: Icon(Icons.check, color: Theme.of(context).primaryColor, size: 14,),),
                                const SizedBox(width: 8,),
                                Text('최소 6자', style: Theme.of(context).primaryTextTheme.titleSmall,),
                              ],
                            ),
                            const SizedBox(height: 12,),
                            Row(
                              children: [
                                CircleAvatar(radius: 12, backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2), child: Icon(Icons.check, color: Theme.of(context).primaryColor, size: 14,),),
                                const SizedBox(width: 8,),
                                Text('숫자 포함', style: Theme.of(context).primaryTextTheme.titleSmall,),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
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
