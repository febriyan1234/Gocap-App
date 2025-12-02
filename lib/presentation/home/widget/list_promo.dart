part of '../page/home_menu_page.dart';

class _ListPromo extends StatelessWidget{
  final String image;
  final String title;

  const _ListPromo({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(16),
            child: Image.network(image, width: MediaQuery.of(context).size.width, height: 250, fit: BoxFit.cover,),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromARGB(65, 0, 0, 0),
              borderRadius: BorderRadius.circular(16)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

}