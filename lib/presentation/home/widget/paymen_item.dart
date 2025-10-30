part of '../page/home_menu_page.dart';

class _PaymenItem extends StatelessWidget {
  const _PaymenItem({
    required this.icon, 
    required this.label, 
    required this.onTapItem,
    required this.description,
  });

  final String icon;
  final String label;
  final String description;
  final Function() onTapItem;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withAlpha(70)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              textAlign: TextAlign.center,
              label,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(description),
                SizedBox(width: 8,),
                 Image.network(icon, height: 30, width: 30,),
                 const SizedBox(height: 8,),
              ],
            )
          ],
        ),
      ),
    );
  }

  
}