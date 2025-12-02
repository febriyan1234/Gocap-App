import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/edit_profile_page/page/edit_profile_page.dart';
import 'package:gocap_app/presentation/profile/widget/build_activity.dart';
import 'package:gocap_app/presentation/profile/widget/build_dashboard.dart';
import 'package:gocap_app/presentation/profile/widget/widget_profil.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                          color: Colors.black.withAlpha(20),
                          blurRadius: 10,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
                            },
                            child: Row(
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
                                InkWell(
                                  borderRadius: BorderRadius.circular(30),
                                  onTap: (){

                                  },
                                  child: Container(
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
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          height: 28,
                          child: ListView.separated(
                            physics: AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: profiles.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 14),
                            itemBuilder: (context, index) {
                              final p = profiles[index];
                              return WidgetProfil(
                                icon: p["image"]!,
                                description: p["description"]!,
                                onTapItem: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    controller: tabController,
                    labelColor: Colors.green.shade700,
                    unselectedLabelColor: Colors.black54,
                    indicatorColor: Colors.green.shade700,
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(text: "Dashbor"),
                      Tab(text: "Aktivitas"),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        BuildDashboard(),
                        Buildactivitiy(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
  