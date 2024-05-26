import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../bloc/authentication_bloc.dart';
import '../bloc/signup_status.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child :Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello User',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is SignUpLoading) {
                  const CircularProgressIndicator();
                } else if (state is SignUpStatusError){
                  showDialog(context: context, builder: (context){
                    return const AlertDialog(
                      content: Text('error'),
                    );
                  });
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      //BlocProvider.of<AuthenticationBloc>(context)
                        //  .add(SignOut());
                    }, child: const Text(
                    'logOut'
                )
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
