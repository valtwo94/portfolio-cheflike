import 'package:cheflike/providers/main_provider.dart';
import 'package:cheflike/widgets/buttons/cancel_button.dart';
import 'package:cheflike/widgets/buttons/primary_button.dart';
import 'package:cheflike/widgets/section_divider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  double cookingTime = 0.0;
  List searchList = ['hi'];

  @override
  Widget build(BuildContext context) {
    final mp = Provider.of<MainProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 100),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 20),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      if(searchList.isEmpty){
                        mp.mainPageController.jumpToPage(0);
                      }else{
                        setState(() {
                          searchList.removeLast();
                        });
                      }

                    },
                    icon: const Icon(
                      FontAwesomeIcons.chevronLeft,
                      size: 20,
                    )),
                Expanded(child: TextField(
                  style: Theme.of(context).primaryTextTheme.titleMedium,
                  decoration: InputDecoration(
                      filled: true,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only( left: 20.0, right: 20),
                        child: Icon(FontAwesomeIcons.magnifyingGlass, size: 20,),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      fillColor: HexColor("#F4F5F7"),
                      enabledBorder: OutlineInputBorder(borderSide: const BorderSide(width: 0, color: Colors.transparent), borderRadius: BorderRadius.circular(30)),
                      suffixIcon: Icon(FontAwesomeIcons.solidCircleXmark, color: HexColor("#3E5481"),)
                  ),

                )),
                IconButton(onPressed: (){
                  showModalBottomSheet(context: context,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20)
                          )
                      ),
                      builder: (context){
                        return StatefulBuilder(
                          builder: (context, setState) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('필터 추가', style: Theme.of(context).primaryTextTheme.titleMedium,),
                                const Flexible(child: SizedBox(height: 40,)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("카테고리", style: Theme.of(context).primaryTextTheme.titleMedium,),
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                Container(
                                  width: MediaQuery.of(context).size.width - 40,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("조리 시간", style: Theme.of(context).primaryTextTheme.titleMedium,),
                                    const SizedBox(width: 4,),
                                    Text("(분)", style: Theme.of(context).textTheme.titleMedium,)
                                  ],
                                ),
                                const SizedBox(height: 8,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${cookingTime.round()}", style: Theme.of(context).primaryTextTheme.titleMedium,)
                                  ],
                                ),
                                const SizedBox(height: 12,),
                                SliderTheme(
                                  data: const SliderThemeData(
                                    trackHeight: 8,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    child: Slider(value: cookingTime,
                                        activeColor: Theme.of(context).primaryColor,
                                        inactiveColor: HexColor("#F4F5F7"),
                                        min: 0,
                                        max: 120,
                                        divisions: 120,
                                        onChanged: (v) => setState(() {
                                          cookingTime = v;
                                        })),
                                  ),
                                ),
                                const Expanded(child: SizedBox(height: 40,)),
                                Row(
                                  children: [
                                    Flexible(child: CancelButton(onPressed: (){}, label: '취소',)),
                                    const SizedBox(width: 12,),
                                    Flexible(child: PrimaryButton(onPressed: (){},label: '완료',)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      });

                }, icon: const Icon(FontAwesomeIcons.filter, size: 20,))
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SectionDivider(),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                      itemCount: 3,
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return const Divider(height: 1,);
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(
                              FontAwesomeIcons.clock,
                              size: 20,
                            ),
                          ),
                          minVerticalPadding: 20,
                          minLeadingWidth: 24,
                          title: Container(child: const Text("PanCakes")),
                          trailing: const Icon(
                            FontAwesomeIcons.xmark,
                            size: 20,
                          ),
                        );
                      }),
                  const SectionDivider(),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '검색어 추천',
                            style: Theme.of(context).primaryTextTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SearchSuggestions(),
                        ],
                      )),
                ],
              ),
            ), ...searchList.map<Widget>((searchInput) =>  SearchOutput(searchInput: searchInput,)),
          ],
        ),
      ),
    );
  }
}





class SearchOutput extends StatelessWidget {
  const SearchOutput({
    super.key, required this.searchInput,
  });

  final String searchInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 100,
      color: Colors.white,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 40,
          itemBuilder: (context, index) => ListTile(title: Text('$index'),))
              );
  }
}

class SearchSuggestions extends StatelessWidget {


  SearchSuggestions({super.key});


  final List<String> suggestions = [
    'Flutter',
    'Dart',
    'Widgets',
    'Material',
    'Chip',
    'Search',
    '1',
    '2',
    '3'
  ];

  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 12.0,
      children: suggestions.map((String suggestion) {
        return Chip(
          backgroundColor: HexColor("#F4F5F7"),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
          label: Text(
            suggestion,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      }).toList(),
    );
  }
}
