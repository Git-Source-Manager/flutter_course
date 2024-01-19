import 'package:flutter/material.dart';
import '../common/Constant_Strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_course/task_12_http_rest_api/Users.dart';
import 'package:flutter_course/task_12_http_rest_api/AppButton.dart';
import 'package:flutter_course/task_12_http_rest_api/BaseClient.dart';

class APIHomePage extends StatelessWidget {
  const APIHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[600],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(ConstantString.str_task_12_sub_title, style: GoogleFonts.acme(fontWeight: FontWeight.normal, fontSize: 20, decoration: TextDecoration.none, color: Colors.white),),
        iconTheme: const IconThemeData(color: Colors.white,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const FlutterLogo(size: 100),
              SizedBox(height: 20,),
              AppButton(
                operation: 'GET',
                operationColor: Colors.lightGreen,
                description: 'Fetch users',
                onPressed: () async {
                  var response =
                      await BaseClient().get('/users/276').catchError((err) {});
                  var users = userFromJson(response);
                },
              ),
              AppButton(
                operation: 'POST',
                operationColor: Colors.lightBlue,
                description: 'Add user',
                onPressed: () async {
                  var users = Users(
                    name: 'Afzal Ali',
                    qualifications: [
                      Qualification(
                          degree: 'Master', completionData: '01-01-2025'),
                    ],
                  );

                  //var response = await BaseClient().post('/users', users).catchError((err) {});
                  // if (response == null) return;
                  // debugPrint('successful:');
                },
              ),
              AppButton(
                operation: 'PUT',
                operationColor: Colors.orangeAccent,
                description: 'Edit user',
                onPressed: () async {
                  var id = 2;
                  var user = Users(
                    name: 'Afzal Ali',
                    qualifications: [
                      Qualification(
                          degree: 'Ph.D', completionData: '01-01-2028'),
                    ],
                  );

                  //var response = await BaseClient().put('/users/$id', user).catchError((err) {});
                  //if (response == null) return;
                  //debugPrint('successful:');
                },
              ),
              AppButton(
                operation: 'DEL',
                operationColor: Colors.red,
                description: 'Delete user',
                onPressed: () async {
                  var id = 2;
                  //var response = await BaseClient().delete('/users/$id').catchError((err) {});
                  //if (response == null) return;
                  //debugPrint('successful:');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
