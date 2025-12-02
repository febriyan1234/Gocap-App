import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/edit_profile_page/widget/account_tile.dart';
part '../widget/gender_bottom_sheet.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameCtrl =
      TextEditingController(text: "Febriyan Nasruloh");
  final TextEditingController phoneCtrl =
      TextEditingController(text: "85600856032");
  final TextEditingController emailCtrl =
      TextEditingController(text: "febriyan.nasruloh1234@gmail.com");
  final TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    genderController.dispose();
    super.dispose();
  }

  bool google = true;
  bool facebook = false;
  bool apple = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // FOTO PROFILE
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.teal.shade400,
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 60),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.camera_alt,
                          color: Colors.teal, size: 18),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // 0 Poin
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.whatshot, color: Colors.orange, size: 18),
                    SizedBox(width: 4),
                    Text("0 Poin >",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // INPUT FIELD
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                hintText: "Nama Lengkap",
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2ECC71), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),

            const SizedBox(height: 15),

            // PHONE FIELD
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text("🇮🇩+62"),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: phoneCtrl,
                    decoration: const InputDecoration(
                      hintText: "Nomor Telepon",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF2ECC71), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                )
              ],
            ),

            const SizedBox(height: 15),

            // EMAIL FIELD
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                hintText: "Email",
                suffixIcon: const Icon(Icons.check_circle, color: Colors.green),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2ECC71), width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                _showGenderBottomSheet(context, (value) {
                  setState(() {
                    genderController.text = value;
                  });
                },);
              },
              child: AbsorbPointer(
                child: TextField(
                  controller: genderController,
                  decoration: const InputDecoration(
                    hintText: "Silahkan pilih jenis kelamin",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF2ECC71),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  readOnly: true,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // PROFILE BISNIS
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Profil",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text("Buat profil bisnis",
                      style: TextStyle(color: Colors.blue, fontSize: 14)),
                  SizedBox(height: 3),
                  Text("Kelola biaya perjalananmu dengan lebih baik",
                      style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // AKUN TERHUBUNG
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Akun yang terhubung",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),
            AccountTile(
              title: "Google", 
              value: google, 
              onChanged: (v) => setState(() => google = v), 
              imageUrl: "https://cdn-icons-png.freepik.com/512/1199/1199414.png",
            ),
            AccountTile(
              title: "Facebook", 
              value: facebook, 
              onChanged: (v) => setState(() => facebook = v), 
              imageUrl: "https://cdn.iconscout.com/icon/free/png-256/free-facebook-logo-icon-svg-download-png-1581916.png?f=webp&w=128",
            ),
            AccountTile(
              title: "Apple", 
              value: apple, 
              onChanged: (v) => setState(() => apple = v), 
              imageUrl: "https://cdn-icons-png.flaticon.com/512/0/747.png",
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {

                  }, 
                  child: Text("Log Keluar", style: TextStyle(fontSize: 16),)
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}