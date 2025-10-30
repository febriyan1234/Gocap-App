import 'package:flutter/material.dart';

part '../widget/store_item.dart';
part '../widget/store_bottom_sheet.dart';

 class HomeMenuPage extends StatelessWidget {
    const HomeMenuPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child:  GridView.builder(
          itemCount: stores.length,
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

       )
        
      );
    }
  }