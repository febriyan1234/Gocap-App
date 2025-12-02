part of '../page/home_menu_page.dart';

class _ListPesanCamilan extends StatelessWidget {
  final String image;
  final String name;
  final String distance;
  final double rating;
  final String promo;
  final bool isAds;
  final Function() onTapItem;

  const _ListPesanCamilan({
    required this.image,
    required this.name,
    required this.distance,
    required this.rating,
    required this.promo,
    required this.isAds,
    required this.onTapItem,
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: SizedBox(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.network(
                image,
                height: 140,
                width: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                if (isAds)
                const Text(
                  "Ikalan",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (isAds)
                const Text(" . ",
                    style: TextStyle(color: Colors.grey)
                ),
                Text(
                  distance,
                  style: const TextStyle(color: Colors.grey),
                ),
                const Text(" . ", style: TextStyle(color: Colors.grey)
                ),
                const Icon(Icons.star, size: 16, color: Colors.orange),
                Text(
                  rating.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.local_offer,
                      size: 16, color: Colors.orange),
                  const SizedBox(width: 6),
                  Text(
                    promo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  

}