import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  final String userName;
  final String slackName;
  final String gitName;
  final String brief;
  final String exp;

  const EditPage({
    Key? key,
    required this.userName,
    required this.slackName,
    required this.gitName,
    required this.brief,
    required this.exp,
  }) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController name = TextEditingController();

  TextEditingController slackUsername = TextEditingController();

  TextEditingController githubUsername = TextEditingController();

  TextEditingController about = TextEditingController();

  TextEditingController experienceText = TextEditingController();
  List updateList = [];

  @override
  void initState() {
    super.initState();
    name.text = widget.userName;
    slackUsername.text = widget.slackName;
    githubUsername.text = widget.gitName;
    about.text = widget.brief;
    experienceText.text = widget.exp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading:IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.green.shade600,
              size: 30,
            )),
        automaticallyImplyLeading: false,
        title: Text(
              "EDIT PAGE",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.green.shade600),
            ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "NAME",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: name,
                // initialValue: widget.UserName,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "SLACK USERNAME",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: slackUsername,
                // initialValue: widget.slackName,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "GITHUB USERNAME",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: githubUsername,
                // initialValue: widget.gitName,
              ),
              const SizedBox(
                height: 18,
              ),
              const Text(
                "ABOUT",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                maxLines: 6,
                controller: about,
                // initialValue: widget.brief,
              ),
              const SizedBox(
                height:18,
              ),
              const Text(
                "EXPERIENCE",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                maxLines: 7,
                controller: experienceText,
                // initialValue: "Exactly",
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade600,
        elevation: 0,
        onPressed: () {
          sendAboutDataBack(context);
        },
        child: const Icon(
          Icons.check_outlined,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }

  void sendAboutDataBack(BuildContext context) {
    String aboutUpdate = about.text;
    String githubUsernameUpdate = githubUsername.text;
    String slackUpdate = slackUsername.text;
    String nameUpdate = name.text;
    String expUpdate = experienceText.text;
    updateList = [
      nameUpdate,
      slackUpdate,
      githubUsernameUpdate,
      aboutUpdate,
      expUpdate,
    ];
    Navigator.pop(context, updateList);
  }
}
