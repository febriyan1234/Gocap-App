import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/profile/widget/shortcut_card.dart';

class BuildDashboard extends StatelessWidget{
  const BuildDashboard ({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF46C663), Color(0xFF1F7B45)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 25,
                        right: -40,
                        child: Container(
                          width: 160,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(38),
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.refresh_rounded,
                            color: Colors.yellow, size: 34),
                            Text("Superbank",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                            Text("Tetapkan Sekarang",
                              style: TextStyle(
                                color: Colors.white70, fontSize: 14)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add, size: 28),
                        SizedBox(height: 8),
                        Text("Tambahkan metode pembayaran", textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ShortcutCard(title: "Buat akun Gokeluarga", icon: Icons.group_add_rounded, bgColor: Colors.blue
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: ShortcutCard(title: "Pusat Bisnis", icon: Icons.work_off_rounded, bgColor: Colors.orange)
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "Untuk mendapatkan nilai lebih",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

}