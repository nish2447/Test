import 'package:est/constants.dart';
import 'package:est/screen.dart';
import 'package:flutter/material.dart';


import 'networking.dart';
Future<Album>? _futureAlbum;


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final TextEditingController _controller = TextEditingController();
    String otp='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: kDecoration.copyWith(hintText: 'Enter your Mobile No'),
                  controller: _controller,
                ),
              SizedBox(height: 10,),
              TextField(
                decoration: kDecoration.copyWith(hintText: 'Enter your OTP'),
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value){
                  otp=value;

                },
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                    setState(() {
                      _futureAlbum = createAlbum(_controller.text,otp);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Screen(_futureAlbum)));
                    });
                    }
                    , child: Text('Verify'))
            ],
          ),
        ),
      ),

    );
  }
}
