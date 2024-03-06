import 'package:cheflike/widgets/section_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('카테고리', style: Theme.of(context).primaryTextTheme.titleMedium,),
              const SizedBox(height: 12,),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(bottom: 20),
                height: 50,
                child: ListView.separated(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index){
                      return const SizedBox(width: 12,);
                    },
                    itemBuilder: (context, index){
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).primaryColor
                        ),
                        child: const Center(
                          child: Text("전체", style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      );
                }),
              ),
              const SectionDivider(),
              Row(
                children: [
                  Expanded(child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2, color: Theme.of(context).primaryColor)
                        )
                    ),
                    child: Center(
                      child: Text("Left", style: Theme.of(context).primaryTextTheme.titleMedium,),
                    ),
                  )),
                  Expanded(child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(width: 2, color: HexColor("F4F5F7"))
                        )
                    ),
                    child: Center(
                      child: Text("Right", style: Theme.of(context).textTheme.titleMedium,),
                    ),
                  ))
                ],
              ),
            ],
          ),
        ),

        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1/1.6
                    ), itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey
                              ),
                            ),
                            const SizedBox(width: 12,),
                            Text("유저명", style: Theme.of(context).primaryTextTheme.titleSmall,overflow: TextOverflow.ellipsis,),

                          ],
                        ),
                        const SizedBox(height: 12,),
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: double.infinity,
                                  height: 160,
                                  color: Colors.grey,

                                ),
                              ),
                            ),
                            const Positioned(
                                top: 10,
                                right: 10,
                                child: Icon(FontAwesomeIcons.solidHeart, ))
                          ],
                        ),
                        const SizedBox(height: 12,),
                        Text("요리명", style: Theme.of(context).primaryTextTheme.titleSmall,),
                        const SizedBox(height: 8,),
                        Row(
                          children: [
                            Text("타입명", style: Theme.of(context).textTheme.bodySmall,),
                            const SizedBox(width: 12,),
                            Text("소요시간", style: Theme.of(context).textTheme.bodySmall,)
                          ],
                        )
                      ],
                    ),
                  );
                })
              ],
            ),
          ),
        )
      ],
    );
  }
}
