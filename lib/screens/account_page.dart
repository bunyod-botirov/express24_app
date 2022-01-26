import 'package:flutter/material.dart';
import 'package:express24/database/user_info.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _fullName =
      TextEditingController(text: UserInfo.userName);

  final TextEditingController _phoneNumber =
      TextEditingController(text: UserInfo.phoneNumber);

  final TextEditingController _birthday =
      TextEditingController(text: UserInfo.birthday);

  final TextEditingController _email =
      TextEditingController(text: UserInfo.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F0F0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text("Аккаунт"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextFormField(
                    controller: _fullName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Полное имя",
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _birthday,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Дата рождения",
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Номер телефона",
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      labelText: "Почта",
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                      ),
                    ),
                  ),
                  DropdownButtonFormField(
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    decoration: const InputDecoration(
                      label: Text("Пол"),
                      contentPadding: EdgeInsets.all(0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        child: Text("Мужской"),
                        value: "Мужской",
                      ),
                      DropdownMenuItem(
                        child: Text("Женский"),
                        value: "Женский",
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        child: const Text("Сохранить"),
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFDE93E),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fixedSize: Size(
            MediaQuery.of(context).size.width * 0.9,
            MediaQuery.of(context).size.height * 0.08,
          ),
        ),
        onPressed: () {
          UserInfo.userName = _fullName.text;
          UserInfo.phoneNumber = _phoneNumber.text;
          UserInfo.birthday = _birthday.text;
          UserInfo.email = _email.text;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text(
                "Сохранено",
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width * 0.3,
              backgroundColor: Colors.black54,
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          );
          Navigator.pop(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
