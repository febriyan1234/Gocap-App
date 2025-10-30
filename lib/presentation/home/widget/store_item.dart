part of '../page/home_menu_page.dart';

class _StoreItem extends StatelessWidget {
    final String icon;
    final String label;
    final Function() onTapItem;

    const _StoreItem({
      Key? key,
      required this.icon,
      required this.label,
      required this.onTapItem,
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: onTapItem,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 238, 238, 238),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(icon, height: 30, width: 30,),
              const SizedBox(height: 8,),
              Text(
                textAlign: TextAlign.center,
                label,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500, 
                ),
              )
            ]
          ),
        )
      );
    }
  }