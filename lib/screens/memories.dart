import 'package:flutter/material.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/cny.jpg',
    title: 'Chinese New Year 2021',
    details: 'This image was taken during a cny party at home.',
  ),
  ImageDetails(
    imagePath: 'images/cwp.jpg',
    title: 'Marsiling Mall',
    details: 'A good pic of the original Causeway Point.',
  ),
  ImageDetails(
    imagePath: 'images/kopi.jpg',
    title: 'Kopitiam',
    details: 'The kopitiam at Marsiling market.',
  ),
  ImageDetails(
    imagePath: 'images/playground.jpg',
    title: 'Marsiling Playground',
    details: 'The upgraded playground introduced under my block',
  ),
  ImageDetails(
    imagePath: 'images/rhday.jpg',
    title: 'Racial Harmony Day',
    details:
        'Celebrated RH day with my childhood friends back when I was primary 2.',
  ),
];

class Memories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // SizedBox(
            //   height: 40,
            // ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            ),
            Text(
              'Memories',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
              //textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  ImageDetails({
    @required this.imagePath,
    @required this.title,
    @required this.details,
  });
}
