import 'package:flutter/material.dart';
import 'package:my_bot_v1/utils/colors.dart';
import 'package:my_bot_v1/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri sufiyanUrl =
        Uri.parse('https://www.linkedin.com/in/mohammed-sufiyan-as-39540b231/');
    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "Developed & Designed by ",
            style: heading(color: primaryTextColor, fontsize: 20),
          ),
          backgroundColor: black,
        ),
        body: Column(
          children: [
            Tile(
              imageUrl: "assets/images/profile_1.png",
              name: "Mohammed Sufiyan",
              role: "Flutter Developer",
              press: () {
                Future<void> _launchUrl() async {
                  if (!await launchUrl(sufiyanUrl)) {
                    throw Exception('Could not launch $sufiyanUrl');
                  }
                }
              },
            ),
            Tile(
              imageUrl: "assets/images/profile_1.png",
              name: "Mariyan Nivaas",
              role: "Product Designer ",
              press: () {},
            ),
          ],
        ));
  }
}

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.role,
    required this.press,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final String role;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: secondaryTextColor,
            width: 1,
          ),
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imageUrl),
          ),
          title: Text(
            name,
            style: body2(
              primaryTextColor,
            ),
          ),
          subtitle: Text(
            role,
            style: body1(
              secondaryTextColor,
            ),
          ),
          trailing: Icon(
            Icons.open_in_new,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
