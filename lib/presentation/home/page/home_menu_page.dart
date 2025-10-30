import 'package:flutter/material.dart';

part '../widget/store_item.dart';
part '../widget/store_bottom_sheet.dart';
part '../widget/paymen_item.dart';
 class HomeMenuPage extends StatelessWidget {
    const HomeMenuPage({super.key});

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


    @override
    Widget build(BuildContext context) {
      return ListView(
        children: [
          GridView.builder(
            padding: EdgeInsets.all(16),
            itemCount: stores.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 8,
              childAspectRatio: 1
            ),
            itemBuilder: (context, index) {
              final store = stores[index];
              return _StoreItem(
                icon: store["image"] ?? "", 
                label: store["name"] ?? "",
                onTapItem: () {
                  if (store["name"] == "Semua") {
                    _showStoreBottomSheet(context);
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
                  onTapItem: () {
                    
                  }
                );
              }, 
            ),
          ) 
        ],
      );
    }
  }