import 'package:flutter/material.dart';
import 'package:mobile_reviewer/styles/pallete.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABOUT US"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: PrimaryColor,
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: PrimaryBG,
          image: DecorationImage(
            image: AssetImage('assets/images/main_bg.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text("ABOUT US"), DeveloperGrid()],
          ),
        ),
      ),
    );
  }
}

class DeveloperCard extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath; // Add imagePath for the developer's picture

  const DeveloperCard({
    Key? key,
    required this.name,
    required this.role,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40, // Adjust the size of the avatar as needed
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(height: 12),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            role,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class DeveloperGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DeveloperCard(
          name: "JARED JAY D. PASCUA",
          role: "PROGRAMMER",
          imagePath:
              'assets/images/Picture1.png', // Path to the image for this developer
        ),
        // Other DeveloperCard instances with respective image paths
        DeveloperCard(
          name: "RICHESS D. BATOLIO ",
          role: "DOCUMENTATOR",
          imagePath:
              'assets/images/Picture2.png', // Path to the image for this developer
        ),
        // Other DeveloperCard instances with respective image paths/ ...
        DeveloperCard(
          name: "ARTHUR LUCKY B. LADAGA ",
          role: "DESIGNER",
          imagePath:
              'assets/images/Picture3.png', // Path to the image for this developer
        ),
        DeveloperCard(
          name: "AYA F. LUMAWIG ",
          role: "DOCUMENTATOR",
          imagePath:
              'assets/images/Picture4.png', // Path to the image for this developer
        ),
      ],
    );
  }
}
