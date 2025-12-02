part of '../page/edit_profile_page.dart';

void _showGenderBottomSheet(BuildContext context, Function(String) onSelected) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      String? seletedGender;

      return StatefulBuilder(builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Apa jenis kelaminmu?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Ini akan membantu kami menyesuaikan dan"
                  "meningkatkan pengalaman pengguna.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                RadioListTile<String>(
                  title: Text("Perempuan"),
                  value: "Perempuan", 
                  groupValue: seletedGender, 
                  onChanged: (value) {
                    setState(() => seletedGender = value);
                    onSelected(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text("Laki-Laki"),
                  value: "Laki-Laki", 
                  groupValue: seletedGender, 
                  onChanged: (value) {
                    setState(() => seletedGender = value);
                    onSelected(value!);
                    Navigator.pop(context);
                  },
                ),
                RadioListTile(
                  title: Text("Tidak ingin menyebutkan"),
                  value: "Tidak ingin menyebutkan", 
                  groupValue: seletedGender, 
                  onChanged: (value) {
                    setState (() => seletedGender = value);
                    onSelected(value!);
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  "Untuk alasan keamanan, kami dapat melakukan pengecekan"
                  "secara berkala terkait informasi yang kamu berikan saat ini"
                  "dengan informasi yang tersimpan pada sistem kami",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black45,
                  ),
                )
              ],
            ),
          );
        }
      );
    }
  );
}