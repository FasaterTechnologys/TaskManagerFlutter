import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/manageuser/logout.dart';
import 'package:taskmanager/manageuser/userfirebaseload.dart';
import 'package:taskmanager/workscreens/profile/shownamechangedialog.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  final TextEditingController _nameController = TextEditingController();
  UserLoaded userLoaded = UserLoaded();

  Future refreshData() async {
    await userLoaded.loaduserData();
    setState(() {});
    return Future.value();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (userDecode.name != "" && userDecode.name.isNotEmpty) {
      return Container(
        width: widthScreen * 0.8,
        height: heigtScreen * 0.25,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 54, 51, 51).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          )
        ], color: container, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    child: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: heigtScreen * 0.04,
                    ),
                    onTap: () {
                      logout(context);
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.person,
                    size: heigtScreen * 0.1,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      Text(userDecode.name, style: appTextStyle),
                      SizedBox(
                        width: widthScreen * 0.05,
                      ),
                      GestureDetector(
                        onTap: () {
                          showNameChangeDialog(
                            context,
                            _nameController,
                            userDecode.uid,
                            refreshData,
                          );
                        },
                        child: Icon(
                          Icons.edit,
                          size: heigtScreen * 0.04,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widthScreen * 0.01,
                  ),
                  Text(
                      userDecode.premium == true
                          ? "Премиум есть"
                          : "Премиума нет",
                      style: appTextStyle),
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
