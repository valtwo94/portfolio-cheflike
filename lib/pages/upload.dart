import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("취소", style: TextStyle(
              color: HexColor("#FF6464"),
              fontWeight: FontWeight.bold
            ),)),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  Text("1/", style: Theme.of(context).primaryTextTheme.titleMedium,),
                  Text("2", style: Theme.of(context).textTheme.titleMedium,)
                ],
              ),
            )
          ],
        ),
      ),
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: PageView(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 327/161,
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      strokeWidth: 3,
                      radius: const Radius.circular(8),
                      color: HexColor("#D0DBEA"),
                      dashPattern: [8, 8],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () async {
                            final picker = ImagePicker();
                            final file = await picker.pickImage(source: ImageSource.gallery);
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Image.png', width: 60,),
                                const SizedBox(height: 12,),
                                Text("이미지 업로드", style: Theme.of(context).primaryTextTheme.titleMedium,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text('음식명', style: Theme.of(context).primaryTextTheme.titleMedium,),
                  const SizedBox(height: 12,),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: '음식명',
                      contentPadding: EdgeInsets.symmetric(horizontal: 32 ,vertical: 20)
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text('설명', style: Theme.of(context).primaryTextTheme.titleMedium,),
                  const SizedBox(height: 12,),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(width: 1, color: HexColor("#D0DBEA"))
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(width: 1, color: Theme.of(context).primaryColor)
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      hintText: '음식에 대해서 설명해주세요'
                    ),

                  ),
                  const SizedBox(height: 20,),
                  Text('조리시간', style: Theme.of(context).primaryTextTheme.titleMedium,),
                  const SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('10', style: Theme.of(context).primaryTextTheme.titleMedium,),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 8,
                    ),
                    child: Container(
                      width: double.infinity,
                      child: Slider(value: 0,
                          activeColor: Theme.of(context).primaryColor,
                          inactiveColor: HexColor("#F4F5F7"),
                          min: 0,
                          max: 120,
                          divisions: 120,
                          onChanged: (v){},
                    ),
                  ),),
                  SizedBox(height: 80,),
                  PrimaryButton(onPressed: (){}, label: '다음', width: double.infinity,)
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('재료', style: Theme.of(context).primaryTextTheme.titleMedium,),
                      GestureDetector(
                        onTap: (){},
                        child: Row(
                          children: [
                            Icon(FontAwesomeIcons.plus, size: 20,),
                            SizedBox(width: 4,),
                            Text("추가", style: Theme.of(context).primaryTextTheme.titleSmall,)
                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
