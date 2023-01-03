// ignore_for_file: use_build_context_synchronously
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simbo_1/_api/apiService.dart';
import 'package:simbo_1/_api/authService.dart';
import 'package:simbo_1/_api/dioClient.dart';
//import 'package:simbo_1/_services/authService.dart';
import 'package:simbo_1/_services/repositoryService.dart';
import 'package:simbo_1/di/service_locator.dart';
import 'package:simbo_1/pages/dashboard.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final authService = locator<AuthService>();
  final apiService = locator<ApiService>();
  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    void displayDialog(context, title, text) => showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(title: Text(title), content: Text(text)),
        );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('CONNEXION'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/homepage/logo_simbo_slim.png',
                height: 150,
                width: 150,
                color: Colors.green,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      color: Color(0xff050505),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
            Container(
              height: 55,
              padding: const EdgeInsets.only(top: 3, left: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: TextFormField(
                  controller: _usernameController,
                  autofocus: false,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      //hintText: "Choisissez-en un",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(0),
                      hintStyle: TextStyle(fontSize: 20.0),
                      errorStyle:
                          TextStyle(color: Colors.black26, fontSize: 15.0))),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 17,
                      color: Color(0xff050505),
                    ),
                    softWrap: false,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 55,
                padding: const EdgeInsets.only(top: 3, left: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextFormField(
                    controller: _passwordController,
                    autofocus: false,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                        //hintText: "Choisissez-en un",
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(0),
                        hintStyle: TextStyle(fontSize: 20.0),
                        errorStyle:
                            TextStyle(color: Colors.black26, fontSize: 15.0))),
              ),
            ),
            ElevatedButton(
              child: Text('Connexion'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () async {
                var username = _usernameController.text;
                var statusCode = await authService.authenticateUser('mlibmkcom3',username, _passwordController.text);
                    //await attemptLogIn(username, _passwordController.text);
                if (statusCode == 200) {
                  print('-------------------api rest----------------------');
                  //final Response response =  await dioClient.get('/typeequipements/simple/list');
                 final response = await apiService.getAllSecteurs();
                  print(response);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Dashboard(username: username)));
                } else {
                  displayDialog(context, "Something went wrong",
                      "No account was found matching that username and password");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
