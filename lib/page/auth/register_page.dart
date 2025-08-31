import 'package:ai_mobile/page/auth/login_page.dart';
import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = true;
  final formkey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ລົງທະບຽນ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        // decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ທ່ານຍັງມີບັນຊີແລ້ວແມ່ນບໍ?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                "ເຂົ້າສູ່ລະບົບ",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, child) {
          return Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/icons/logo.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("BenzBook"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('ຊື່ ແລະ ນາມສະກຸນ'),
                    ),
                    TextFormField(
                      controller: fullnameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ກະລຸນາປ້ອນຊື່ ແລະ ນາມສະກຸນ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'ຊື່ ແລະ ນາມສະກຸນ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('ອີເມວລ໌'),
                    ),
                    TextFormField(
                      controller: emailController,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "ກະລຸນາປ້ອນອີເມວລ໌";
                      //   } else if (value!.contains("@gmail.com")) {
                      //     return "ອີເມວລ໌ຕ້ອງມີ @gmail.com";
                      //   } else {
                      //     return null;
                      //   }
                      // },
                      decoration: InputDecoration(
                        hintText: 'ອີເມວລ໌',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('ເບີໂທລະສັບ'),
                    ),
                    TextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ກະລຸນາປ້ອນເບີໂທລະສັບ";
                        } else if (value.length < 10) {
                          return "ເບີໂທລະສັບຕ້ອງມີ 10 ຕົວອັກສອນ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: '20xxxxxxxx',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('ລະຫັດຜ່ານ'),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ກະລຸນາປ້ອນລະຫັດຜ່ານ";
                        } else if (value.length < 6) {
                          return "ລະຫັດຜ່ານຕ້ອງມີຢ່າງໜ້ອຍ 6 ຕົວອັກສອນ";
                        } else {
                          return null;
                        }
                      },
                      obscureText: showPassword,
                      decoration: InputDecoration(
                        hintText: '********',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.security),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon:
                              showPassword == true
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.remove_red_eye),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "ລືມລະຫັດຜ່ານ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          auth.Register(
                            fullname: fullnameController.text,
                            email: emailController.text,
                            phoneNumber: phoneNumberController.text,
                            password: passwordController.text,
                          );
                        } else {
                          print("Invalid");
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "ລົງທະບຽນ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
