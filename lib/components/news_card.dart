import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final String headline;
  final String publisher;
  final String thumbnail;
  final Uri url;
  const NewsCard(
      {super.key,
      required this.headline,
      required this.publisher,
      required this.thumbnail,
      required this.url});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _launchUrl(widget.url);
      },
      child: Column(
        children: [
          Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            padding: const EdgeInsets.only(left: 6, right: 6),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 225, 177, 35),
                  width: 2.0,
                )),
            child: Row(
              children: [
                Container(
                  // height: 70,
                  width: 120,
                  margin: const EdgeInsets.only(right: 10),
                  child: Image.network(widget.thumbnail),
                ),
                Expanded(
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.headline,
                        softWrap: true,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.publisher,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
