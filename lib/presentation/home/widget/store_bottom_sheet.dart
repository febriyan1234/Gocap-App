part of '../page/home_menu_page.dart';



void _showStoreBottomSheet(BuildContext context, List<StoreModel> stores) {
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
                  icon: store.image, 
                  label: store.name,
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