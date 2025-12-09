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
      Provider.of<HomeProvider>(context, listen: false).loadHomeData();
    });
  }

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
                    itemCount: homeProv.payments.length,
                    itemBuilder: (context, index) {
                      final payment = homeProv.payments[index];
                      return _PaymenItem(
                        icon: payment.image, 
                        label: payment.name,
                        description: payment.description, 
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
                    itemCount: homeProv.promos.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final promo = homeProv.promos[index];
                      return _ListPromo(
                        image: promo.image, 
                        title: promo.title,
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
                    itemCount: homeProv.foods.length,
                    itemBuilder: (context, index) {
                      final food = homeProv.foods[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child:  _ListPesanCamilan(
                          image: food.image,
                          name: food.name,
                          distance: food.distance,
                          rating: food.rating,
                          promo: food.promo,
                          isAds: food.isAds,
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