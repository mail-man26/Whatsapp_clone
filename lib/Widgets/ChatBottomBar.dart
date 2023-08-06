import 'package:flutter/material.dart';

class ChatBotomBar extends StatelessWidget {
  const ChatBotomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.emoji_emotions_outlined,
                  color: Colors.black38,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 200,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context, builder: (builder) => attachment());
                  },
                  icon: const Icon(
                    Icons.attachment_outlined,
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.black38,
                  size: 30,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xFF00887A),
                borderRadius: BorderRadius.circular(30)),
            child: Icon(
              Icons.mic,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

Widget attachment() {
  return Container(
    height: 278,
    child: Card(
      //color: Colors.transparent,
      margin: const EdgeInsets.all(18.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(
                    Icons.insert_drive_file, Colors.indigo, "Document"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconCreation(Icons.headset, Colors.orange, "Audio"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.location_pin, Colors.teal, "Location"),
                SizedBox(
                  width: 40,
                ),
                iconCreation(Icons.person, Colors.blue, "Contact"),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget iconCreation(IconData icons, Color color, String text) {
  return InkWell(
    onTap: () {},
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icons,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
          ),
        )
      ],
    ),
  );
}
