import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist_app/models/task.dart';

import 'tasks.dart';

class AuthVerify extends StatelessWidget {
  
  const AuthVerify({super.key});
  
  

  /*
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [],
          );
        }

        return const Tasks();
      },
    );
  }
  */
  @override
  Widget build(BuildContext context) {

   

    //1
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
                providers: [
                  EmailAuthProvider(), // new
                ],
                headerBuilder: (context, constraints, shrinkOffset) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset('assets/logo.png'),
                    ),
                  );
                });
          } else {
            //return const Tasks();
            
            return Column(
            children: [
              Row(
                children: [
                   Material( // Ajoutez le widget Material ici
          child: DropdownButton<Category>(
                items: Category.values.map((category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (Category? newValue) {},
              ),

                   )   
                ],
              ),
              const Tasks(),
            ],
          );
        }
      },
    );
          }
          }