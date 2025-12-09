import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/edit_profile_page/page/edit_profile_page.dart';
part '../widget/circle_icon.dart';
part '../widget/stat_item.dart';

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
                SizedBox(height: 210),
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.teal, Colors.teal.shade700],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 45,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context), 
                      icon: Icon(Icons.arrow_back, color: Colors.white,),
                    )
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
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.green,
                          child: Icon(Icons.person, size: 50, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Febriyan N.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _StatItem(title: "suka", value: "0"),
                SizedBox(width: 30),
                _StatItem(title: "pengikut", value: "0"),
                SizedBox(width: 30),
                _StatItem(title: "mengikuti", value: "0"),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 35, 202, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
              }, 
              child: Text(
                "Ubah profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            )
          ],
        ),
      ),
    );
  }

}