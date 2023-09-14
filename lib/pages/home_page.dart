import 'package:flutter/material.dart';
import 'package:my_cv/pages/edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "PORTFOLIO",
          style: TextStyle(
          fontWeight: FontWeight.w900, color: Colors.green.shade600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.shade50,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(height: 20,),
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 5),
                          borderRadius: BorderRadius.circular(25),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage("assets/images/home_img.jpeg"))),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [Text("NAME"),
                              Text(
                                "${textList[0]}",
                                style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade600),
                              ),],
                          ),

                          Column(
                            children: [
                              Text("SLACK USERNAME",),
                              Text(
                                "${textList[1]}",
                                style:
                                TextStyle(fontSize: 18, fontWeight: FontWeight.w800,color: Colors.green.shade600),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("GITHUB USERNAME"),
                    Text(
                      "${textList[2]}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800,color: Colors.green.shade600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.shade50,
                ),
                height: MediaQuery.of(context).size.height / 3,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ABOUT",
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                            color: Colors.green.shade600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${textList[3]}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.shade50,
                ),
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("EXPERIENCE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.green.shade600)),
                      SizedBox(height: 5,),
                      Text(
                        "${textList[4]}",style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          awaitNumber(context);
        },
        backgroundColor: Colors.green.shade600,
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }

  void awaitNumber(BuildContext context) async {
    String name = textList[0];
    String slackUsername = textList[1];
    String githubUsername = textList[2];
    String briefprofile = textList[3];
    String experience = textList[4];
    final List returnedList = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPage(
          userName: name,
          slackName: slackUsername,
          gitName: githubUsername,
          brief: briefprofile,
          exp: experience,
        ),
      ),
    );
    setState(() {
      textList = returnedList;
    });
  }

  List textList = [
    "Rayhan Awojobi",
    "Rayhan",
    "dexterousNorthpaw",
    "I'm a junior mobile developer who specializes in Flutter. I'm getting better at using this flexible framework for making cross-platform apps. Creating responsive, visually appealing user experiences with Flutter apps and making sure they work well on both Android and iOS is one of my main skills",
    " With almost a year's worth of experience working in the field of mobile app development. My focus area for the past year has been android mobile development with flutter and dart. I have collaborated with designers to implement user-centered design concepts, and I am continually working to enhance my testing and problem-solving abilities in order to improve the overall quality of mobile applications.",
  ];
}
