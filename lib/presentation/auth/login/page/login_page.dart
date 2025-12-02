import 'package:flutter/material.dart';
import 'package:gocap_app/presentation/profile/page/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    
    void login() async {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone == "085600856032" && password == "Febriyan") {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLogin', true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Nomor atau Password salah!"))
        );
      }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 61, 177, 96),
              Color.fromARGB(255, 57, 169, 137),
              Color.fromARGB(255, 28, 143, 149),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.white,),
                  hint: Text("Phone Number", style: TextStyle(color: Colors.white),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white54, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white54, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.white,),
                  hint: Text("Password", style: TextStyle(color: Colors.white),),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white54, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white54, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 32,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (){
                    login();
                  }, 
                  child: Text("Login")
                ),
              ),
              TextButton(
                onPressed: (){

                }, 
                child: Text("Forgot Password ?", style: TextStyle(color: Colors.white),)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: (){

                    }, 
                    child: Text("Don't ave an account ?", style: TextStyle(color: Colors.white),)
                  ),
                  TextButton(
                    onPressed: () {

                    }, 
                    child: Text("Sign Up", style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    height: 2,
                    width: 125,
                  ),
                  SizedBox(width: 6,),
                  Text("OR", style: TextStyle(color: Colors.white),),
                  SizedBox(width: 6,),
                  Container(
                    color: Colors.white,
                    height: 2,
                    width: 125,
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up with social Networks", style: TextStyle(color: Colors.white),)
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.facebook),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  

