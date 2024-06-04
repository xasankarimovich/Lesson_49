import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List infos = ["Karimovich", "Xasan", "+998943920033"];
  List infos2 = ["Surname:", "Name:", "Phone:"];

  TextEditingController surnameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  void saveInfo() {
    if (surnameController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        numberController.text.isNotEmpty) {
      infos[0] = surnameController.text;
      infos[1] = nameController.text;
      infos[2] = numberController.text;
      setState(() {});
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk7NXcWUEKOkFKErBfauL8qarAE8H_a2hzqg&s"),
              )),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "About Me",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white24),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 170,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) {
                  return Text(
                    "${infos2[index]}   ${infos[index]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: infos.length),
          ),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: (context),
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: surnameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              label: const Text(
                                "Enter surname",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              label: const Text(
                                "Enter name",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: numberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                label: const Text(
                                  "Enter phone number",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              onPressed: saveInfo, child: const Text("Save"))
                        ],
                      ),
                    );
                  });
            },
            child: const Text(
              "Edit profile",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
