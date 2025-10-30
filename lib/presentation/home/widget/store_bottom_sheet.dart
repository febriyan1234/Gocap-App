part of '../page/home_menu_page.dart';

final List<Map<String, String>> stores = const [
  {
    "name": "Warung Bu Siti",
    "description": "Makanan rumahan dan lauk pauk",
    "image": "https://cdn-icons-png.flaticon.com/512/3075/3075977.png"
  },
  {
    "name": "Toko Sembako",
    "description": "Sembako lengkap dan murah",
    "image": "https://cdn-icons-png.freepik.com/512/1041/1041883.png"
  },
  {
    "name": "Mart Sejahtera",
    "description": "Belanja kebutuhan harian",
    "image": "https://cdn-icons-png.flaticon.com/512/3081/3081559.png"
  },
  {
    "name": "Toko Sayur",
    "description": "Sayuran segar setiap hari",
    "image": "https://cdn-icons-png.flaticon.com/512/3082/3082031.png"
  },
  {
    "name": "Pulsa & Bills",
    "description": "Makanan rumahan dan lauk pauk",
    "image": "https://cdn-icons-png.flaticon.com/512/762/762613.png"
  },
  {
    "name": "PLN",
    "description": "Sembako lengkap dan murah",
    "image": "https://cdn-icons-png.flaticon.com/512/9746/9746847.png"
  },
  {
    "name": "Top Up",
    "description": "Belanja kebutuhan harian",
    "image": "https://cdn-icons-png.freepik.com/512/2534/2534215.png"
  },
  {
    "name": "Semua",
    "description": "Belanja kebutuhan harian",
    "image": "https://cdn-icons-png.flaticon.com/512/872/872324.png"
  },
];

void _showStoreBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: true,
    isScrollControlled: true,
    context: context, 
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Semua Layanan"),
            SizedBox(height: 20,),
            GridView.builder(
              shrinkWrap: true,
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
                    // _showStoreBottomSheet(context);
                  },
                );
              }
            )
          ],
        ),
      );
    }
  );
} 