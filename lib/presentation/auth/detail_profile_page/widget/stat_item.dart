part of '../page/detail_profile_page.dart';

class _StatItem extends StatelessWidget{
  final String title;
  final String value;

  const _StatItem({
    super.key, 
    required this.title,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }

}