import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/profile/widget/widget_profil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final List<Map<String, String>> profiles = const [
    {
      "description": "GocapUnlimited",
      "image": "https://cdn-icons-png.freepik.com/512/6979/6979203.png"
    },
    {
      "description": "Lacak Kemajuan",
      "image": "https://cdn-icons-png.flaticon.com/512/6701/6701712.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F9F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F9F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 26),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(13),
                    blurRadius: 10,
                    offset: const Offset(0, 32),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2FB49A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, color: Colors.white, size: 32),
                      ),

                      const SizedBox(width: 14),
                      const Expanded(
                        child: Text(
                          "Febriyan Nasruloh",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFE3F5F1),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          "Profil",
                          style: TextStyle(
                            color: Color(0xff2fb49a),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    height: 28,
                    child: ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: profiles.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, index) {
                        final profile = profiles[index];
                        return WidgetProfil(
                          icon: profile["image"] ?? "", 
                          description: profile["description"] ?? "", 
                          onTapItem: (){

                          });
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
