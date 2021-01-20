import 'package:flutter/material.dart';
import 'package:psnrz_app/screens/ImageView.dart';

Widget wallPaper(List imagesPath, BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,
        children: imagesPath.map((imagePath) {
          return GridTile(
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageView(
                              imgPath: imagePath,
                            )
                        )
                    );
                  },
                  child: Hero(
                    tag: imagePath,
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child:  Image.network(
                            imagePath,
                            height: 50,
                            width: 100,
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  )
              )
          );
        }).toList()),
  );
}