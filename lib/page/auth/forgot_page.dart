import 'package:ai_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  bool showPassword = true;
  final formkey = GlobalKey<FormState>();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ລືມລະຫັດຜ່ານ",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 120,
      //   // decoration: BoxDecoration(color: Colors.grey.shade100),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('ທ່ານຍັງບໍ່ມີບັນຊີ?'),
      //       TextButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => RegisterPage()),
      //           );
      //         },
      //         child: Text("ລົງທະບຽນ", style: TextStyle(color: Colors.blue)),
      //       ),
      //     ],
      //   ),
      // ),
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
                    // Center(
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(20),
                    //     child: Image.asset(
                    //       'assets/icons/logo.png',
                    //       height: 100,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    // Center(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Text("BenzBook"),
                    //   ),
                    // ),
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
                      child: Text('ລະຫັດຜ່ານໃໝ່'),
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ກະລຸນາປ້ອນລະຫັດຜ່ານໃໝ່";
                        } else if (value.length < 1) {
                          return "ລະຫັດຜ່ານຕ້ອງມີຢ່າງໜ້ອຍ 6 ຕົວອັກສອນ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'ລະຫັດຜ່ານໃໝ່',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorBorder: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.security),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text('ຢັ້ງຢືນລະຫັດຜ່ານໃໝ່'),
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ກະລຸນາຢັ້ງຢືນລະຫັດຜ່ານໃໝ່";
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "ລືມລະຫັດຜ່ານ",
                    //         style: TextStyle(color: Colors.blue),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          auth.Forgot(
                            phoneNumber: confirmPasswordController.text,
                            password: passwordController.text,
                            confirmPassword: confirmPasswordController.text,
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
                          child:
                              auth.loading == true
                                  ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                  : Text(
                                    "ຍືນຍັນ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
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
