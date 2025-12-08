import 'package:flutter/material.dart';
import 'package:gocap_app/model/store_model.dart';
import 'package:gocap_app/presentation/auth/login/page/login_page.dart';
import 'package:gocap_app/presentation/home/provider/home_provider.dart';
import 'package:gocap_app/presentation/profile/page/profile_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part '../widget/store_item.dart';
part '../widget/store_bottom_sheet.dart';
part '../widget/paymen_item.dart';
part '../widget/list_pesan_camilan.dart';
part '../widget/list_promo.dart';
part '../widget/appbar_home.dart';

class HomeMenuPage extends StatefulWidget {
  const HomeMenuPage({super.key});

  @override
  State<StatefulWidget> createState() => HomeMenuPageState();

}
class HomeMenuPageState extends State<HomeMenuPage> {

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   homeProv = Provider.of<HomeProvider>(context);
    //   homeProv.getStores();
    // });
     WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).getStores();
    });
  }

    final List<Map<String, String>> payments= const [
      {
        "name": "Link",
        "description": "Superbank",
        "image": "https://cdn-icons-png.flaticon.com/512/428/428641.png"
      },
      {
        "name": "Bayar sekaligus",
        "description": "Top up & tagihan",
        "image": "https://cdn-icons-png.flaticon.com/512/7988/7988932.png"
      },
      {
        "name": "Event",
        "description": "Ayo Ikuti",
        "image": "https://cdn-icons-png.flaticon.com/512/8003/8003357.png"
      },
      {
        "name": "Go point",
        "description": "Point Gocap",
        "image": "https://cdn-icons-png.flaticon.com/512/8003/8003357.png"
      },
    ];

  final List<Map<String, dynamic>> pesans = const [
      {
        "image": "https://franchisepedia.id/wp-content/uploads/2022/02/LOGO-KOPTE-1-1024x1024.jpg",
        "name": "Kopte by Dum Group - Suradita",
        "distance": "1.6 km",
        "rating": 4.8,
        "promo": "Diskon Rp4.000",
        "isAds": true,
      },
      {
        "image": "https://www.sunwaycarnival.com/static/shops/b7f92e1909fea090e598f7c1af7aa927/w768.png",
        "name": "Mixue - Suradita",
        "distance": "i.7 km",
        "rating": 5.0,
        "promo": "Diskon Rp4.000",
        "isAds": false,
      },
      {
        "image": "https://cdn.vectorstock.com/i/1000v/56/54/dimsum-logo-cute-dim-sum-character-vector-46975654.jpg",
        "name": "Dimsum korpri",
        "distance": "3.8 km",
        "rating": 4.6,
        "promo": "Diskon Rp6.000",
        "isAds": false,
      }
    ];

    final List<Map<String, String>> promos = const [
      {
        "image": "https://static.vecteezy.com/system/resources/previews/020/011/915/non_2x/food-promotion-banner-free-editor_template.jpeg",
        "title": "Pasta 35% OFF",
      },
      {
        "image": "https://img.pikbest.com/backgrounds/20210706/creative-food-pizza-promotion-banner-template_6047756.jpg!sw800",
        "title": "Pizza 50% OFF",
      },
      {
        "image": "https://crm.id/blog/wp-content/uploads/2025/05/cara-promosi-makanan.png",
        "title": "Spageti Special",
      }
    ];

    @override
    Widget build(BuildContext context) {
      final homeProv = Provider.of<HomeProvider>(context);
      return Scaffold(
        appBar: _AppBarHome(
          onTapQr: () {
            print("QR ditekan");
          },
          onTapProfile: () async {
            final prefs = await SharedPreferences.getInstance();
            final isLogin = prefs.getBool('isLogin') ?? false;
            if (isLogin){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => ProfilePage()
                ),
              );
            }else {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        ),
        body: Builder(
          builder: (context) {
            if (homeProv.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (homeProv.erorMessage != null) {
              return Center(child: Text(homeProv.erorMessage!));
            }
            return ListView(
              children: [
                GridView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: homeProv.stores.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1
                  ),
                  itemBuilder: (context, index) {
                    final store = homeProv.stores[index];
                    return _StoreItem(
                      icon: store.image, 
                      label: store.name,
                      onTapItem: () {
                        if (store.name == "Semua") {
                          _showStoreBottomSheet(context, homeProv.stores);
                        }
                      },
                    );
                  }
                ),
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 16),
                    itemCount: payments.length,
                    itemBuilder: (context, index) {
                      final payment = payments[index];
                      return _PaymenItem(
                        icon: payment["image"] ?? "", 
                        label: payment ["name"] ?? "",
                        description: payment ["description"] ?? "", 
                        onTapItem: () {}
                      );
                    }, 
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(16, 24, 0, 8),
                  child: Text(
                    "Promo Hari Ini",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: promos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final promo = promos[index];
                      return _ListPromo(
                        image: promo["image"] ?? "", 
                        title: promo["title"] ?? "",
                      );
                    }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 24, 0, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pesan makan malam dari",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
            
                        }, 
                        icon: Icon(Icons.arrow_circle_right_outlined)
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    itemCount: pesans.length,
                    itemBuilder: (context, index) {
                      final pesan = pesans[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child:  _ListPesanCamilan(
                          image: pesan["image"] ?? "",
                          name: pesan["name"] ?? "",
                          distance: pesan["distance"] ?? "",
                          rating: pesan["rating"] ?? "",
                          promo: pesan["promo"] ?? "",
                          isAds: pesan["isAds"] ?? false,
                          onTapItem: () {},
                        ),
                      );
                    }
                  ),
                ),
              ],
            );
          }
        ) ,
      );
    }
  }