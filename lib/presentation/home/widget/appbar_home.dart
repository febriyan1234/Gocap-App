part of '../page/home_menu_page.dart';

class _AppBarHome extends StatelessWidget implements PreferredSize {

  final VoidCallback? onTapQr;
  final VoidCallback? onTapProfile;
  
  const _AppBarHome({
    this.onTapQr,
    this.onTapProfile,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 28, left: 16, right: 16, bottom: 14),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF65D787),
            Color(0xFF5DD2B0),
            Color(0xFF57C9CF),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: onTapQr,
              child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
            
            const SizedBox(width: 12,),
            Expanded(
              child: Container(
                height: 46,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Row(children: [
                  const Icon(Icons.search, color: Colors.grey, size: 22,),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Cari makanan",
                        hintStyle: TextStyle(color: Colors.grey),
                        isCollapsed: true,
                      ),
                    )
                  )
                ],
              ),
            )
          ),
          const SizedBox(width: 12),

          GestureDetector(
            onTap: onTapProfile,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.black,
                size: 26,
              ),
            ) ,
          ),
        ],
      ),
    )  
  );
}
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
  
  @override
  Size get preferredSize =>const Size.fromHeight(90);
  
  
  


}