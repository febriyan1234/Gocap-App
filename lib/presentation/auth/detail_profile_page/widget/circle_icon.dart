part of '../page/detail_profile_page.dart';

class _CircleIcon extends StatelessWidget{
  final IconData icon;
  

  const _CircleIcon({
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: Colors.black,
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }

}