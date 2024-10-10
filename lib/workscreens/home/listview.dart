import 'package:flutter/material.dart';
import 'package:taskmanager/consts.dart';
import 'package:taskmanager/managedata/managedata.dart';

Widget listView(Function refreshData) {
  ManageData manageData = ManageData();
  return FutureBuilder(
      future: manageData.loadData(),
      builder: (context, snapshot) {
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          data[index].title,
                          style: appTextStyle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        subtitle: Text(
                          data[index].description,
                          style: applowTextStyle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: heigtScreen * 0.014),
                      child: GestureDetector(
                        onTap: () async {
                          data.removeAt(index);
                          await manageData.saveData();
                          refreshData();
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 207, 207, 207),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
}
