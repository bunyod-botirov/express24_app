import 'package:flutter/material.dart';
import 'package:express24/database/user_info.dart';
import 'package:express24/screens/account_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Профиль"),
      ),
      body: Column(
        children: <Widget>[
          top(context),
          middle(context),
          cashbackButton(context),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Выйти",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const Text(
            "2.0.14",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Container top(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
            title: Text(
              UserInfo.userName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              UserInfo.phoneNumber,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.settings),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AccountPage(),
                ),
              );
              setState(() {});
            },
          ),
          const Divider(
            height: 0,
            thickness: 0.5,
          ),
          const Spacer(),
          Row(
            children: <Widget>[
              const SizedBox(width: 20),
              const Text(
                "Баланс: ",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
              Text(
                "${UserInfo.score} балл",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Container middle(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.notifications_none,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Уведомления",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.credit_card,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Платежные карты",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
          Divider(
            height: 0,
            thickness: 1,
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(
              Icons.chat_bubble_outline,
              color: Colors.black87,
              size: 30,
            ),
            title: Text(
              "Обратная связь",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container cashbackButton(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const ListTile(
        horizontalTitleGap: 0,
        leading: Icon(
          Icons.monetization_on_outlined,
          color: Colors.black87,
          size: 30,
        ),
        title: Text(
          "Кешбэк",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}
