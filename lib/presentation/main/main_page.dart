import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/home/page/home_menu_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    int _selectedIndex = 0;
    
    final List<Widget> _pages = [
      const HomeMenuPage(),
      const Center(child: Text('Jelajahi', style: TextStyle(fontSize: 22))),
      const Center(child: Text('Pembayaran', style: TextStyle(fontSize: 22))),
      const Center(child: Text('Aktifitas', style: TextStyle(fontSize: 22),),),
      const Center(child: Text('Kotak Masuk', style: TextStyle(fontSize: 22),),),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color.fromRGBO(68, 138, 255, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "jelajahi",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.payments),
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  )
                ),
              ],
            ),
            label: "Pembayaran",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Aktivitas",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.chat_bubble_outline),
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            label: "Kotak Masuk",
          ),
        ]
      ),
      );
    }

  }

 




