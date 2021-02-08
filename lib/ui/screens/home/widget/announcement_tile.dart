import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AnnouncementTile extends StatelessWidget {
  final FirebaseFirestore fb = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getImages(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: 150,
              child: VxSwiper.builder(
                itemCount: snapshot.data.docs.length,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index,) {
                  return Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Center(
                      child: snapshot.data.docs.length != null? Card(
                        elevation: 5,
                        child: Image.network(
                            snapshot.data.docs[index].data()["url"],
                        ),
                      ):Center(child:CircularProgressIndicator())
                    ),
                  );
                },
                height: 300,
                viewportFraction: context.isMobile ? 0.75 : 1.9,
                autoPlay: true,
                autoPlayAnimationDuration: 1.seconds,
              )
            );
          } else if (snapshot.connectionState == ConnectionState.none) {
            return Text("No data");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<QuerySnapshot> getImages() {
    return fb.collection("announcements").get();
  }
}
