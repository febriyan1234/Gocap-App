import 'package:flutter/material.dart';
part '../widget/circle_icon.dart';

class DetailProfilePage extends StatelessWidget{
  const DetailProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://img.pikbest.com/backgrounds/20250126/the-abstract-colors-and-blurred-background-texture-of-green-color-with-diagonal-lines_11450181.jpg!w700wp"),
                    fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 45,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ),
                Positioned(
                  right: 15,
                  top: 45,
                  child: Row(
                    children: [
                      _CircleIcon(icon: Icons.share),
                      SizedBox(width: 10),
                      _CircleIcon(icon: Icons.settings),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.person, size: 50, color: Colors.white,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}