import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:cheflike/widgets/buttons/send_again_button.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PasswordVerificationCodePage extends StatefulWidget {
  const PasswordVerificationCodePage({super.key});

  @override
  State<PasswordVerificationCodePage> createState() => _PasswordVerificationCodePageState();
}

class _PasswordVerificationCodePageState extends State<PasswordVerificationCodePage> {
  late StopWatchTimer _stopWatchTimer;

  @override
  void initState() {
    _stopWatchTimer = StopWatchTimer(
        mode: StopWatchMode.countDown,
        presetMillisecond: 180000
    );
    _stopWatchTimer.onStartTimer();
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
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
                Text('이메일을 확인해주세요', style: Theme.of(context).primaryTextTheme.titleLarge),
                const SizedBox(height: 12),
                Text("인증코드가 전송되었습니다", style: Theme.of(context).textTheme.titleMedium
                  ,),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(

                    children: [
                      buildPinput(),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('인증번호 만료까지 : ', style: Theme.of(context).primaryTextTheme.titleMedium,),
                            StreamBuilder<int>(
                                stream: _stopWatchTimer.secondTime,
                                initialData: 0,
                                builder: (context, snapshot) {
                                  final value = snapshot.data;
                                  final minute = (value??0) ~/ 60;
                                  final second = (value??0) % 60;
                                  return Text('$minute:${second.toString().padLeft(2, '0')}', style: TextStyle(
                                      fontSize: 18,
                                      color: HexColor("#FF6464")
                                  ),);
                                }
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(onPressed: (){}, label: '인증하기', width: double.infinity,),
                      const SizedBox(height: 20,),
                      SendAgainButton(onPressed: (){
                        _stopWatchTimer.onResetTimer();
                        _stopWatchTimer.onStartTimer();
                      }, label: '인증번호 재전송', width: double.infinity,)
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

  Pinput buildPinput(){
    final defaultPinTheme = PinTheme(
      margin: const EdgeInsets.all(4),
      padding: EdgeInsets.zero,
      width: 72,
      height: 72,
      textStyle: Theme.of(context).primaryTextTheme.titleLarge,
      decoration: BoxDecoration(
        border: Border.all(color: HexColor('#D0DBEA')),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).primaryColor),
      borderRadius: BorderRadius.circular(20),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: (s) {
        return s == '2222' ? null : '인증번호가 일치하지 않습니다';
      },
      errorTextStyle: TextStyle(
          color: HexColor("#FF6464")
      ),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) => print(pin),
    );
  }
}
