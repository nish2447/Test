import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'networking.dart';

class Screen extends StatelessWidget {
    Screen(this._futureAlbum);
    Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verified Accounts Here'),
      ),

      body: Center(
        child: FutureBuilder<Album>(
          future: _futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(snapshot.data!.id),
                  SizedBox(height: 10,),
                  Text(snapshot.data!.title)
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
