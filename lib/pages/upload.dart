import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

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
            TextButton(onPressed: (){}, child: Text("취소", style: TextStyle(
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
