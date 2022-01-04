// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class CheckerAssignments extends StatefulWidget {
  @override
  _CheckerAssignments createState() => new _CheckerAssignments();
}

class _CheckerAssignments extends State<CheckerAssignments> {
  List checkerAssignments = [
    {
      'title': 'Mathematics Chapter 1 ',
      'subject': 'Mathematics',
      'status': '2',
      'group': 'In Review',
      'image':
          'https://images.unsplash.com/photo-1544717305-2782549b5136?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'title': 'Mathematics Chapter 2',
      'subject': 'Mathematics ',
      'status': '2',
      'group': 'In Review',
      'image':
          'https://images.unsplash.com/photo-1596495578066-1aac1b785b3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1180&q=80'
    },
    {
      'title': 'Mathematics Chapter 3',
      'subject': 'Mathematics',
      'status': '3',
      'group': 'Completed',
      'image':
          'https://images.unsplash.com/photo-1517256673644-36ad11246d21?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'title': 'Biology Chapter 1',
      'subject': 'Biology',
      'status': '3',
      'group': 'Completed',
      'image':
          'https://images.unsplash.com/photo-1495995424756-6a5a3f9e7543?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80'
    },
    {
      'title': 'Biology Chapter 1',
      'subject': 'Biology',
      'status': '3',
      'group': 'Completed',
      'image':
          'https://images.unsplash.com/photo-1544168190-79c17527004f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'
    },
    {
      'title': 'Biology Chapter 2',
      'subject': 'Biology',
      'status': '4',
      'group': 'Follow Up',
      'image':
          'https://images.unsplash.com/photo-1596495717788-01458887290b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xff20b24d),
                        indicatorColor: Colors.green,
                        isScrollable: true,
                        padding: EdgeInsets.fromLTRB(00, 0, 0, 0),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff20b24d),
                        ),
                        tabs: [
                          Tab(
                            child: Text(
                              'All',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'In Review',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Checked',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Follow up',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      children: [
                        listViewBuild(),
                        Text('In Review'),
                        Text('Checked'),
                        Text('Follow up'),
                      ],
                    ),
                  )
                ],
              )),
        ) // This trailing comma m
        );
  }

  Widget listViewBuild() {
    return GroupedListView<dynamic, String>(
      elements: checkerAssignments,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) =>
          item1['title'].compareTo(item2['title']),
      order: GroupedListOrder.ASC,
      useStickyGroupSeparators: true,
      stickyHeaderBackgroundColor: Colors.white,
      groupSeparatorBuilder: (String value) {
        Color stringColor = Colors.grey;

        if (value == "In Review") {
          stringColor = Colors.orange;
        } else if (value == "Completed") {
          stringColor = Color(0xff20b24d);
        } else if (value == "Follow Up") {
          stringColor = Colors.red;
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$value ",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Color(0xff1d1d1d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      letterSpacing: 2.0),
                ),
                TextSpan(
                  text: "()",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: stringColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      letterSpacing: 1.5),
                ),
              ],
            ),
            textAlign: TextAlign.start,
          ),
        );
      },
      itemBuilder: (c, element) {
        Color stringColor = Colors.grey;
        IconData iconGroup = Icons.info;
        if (element['group'] == "In Review") {
          stringColor = Colors.orange;
          iconGroup = Icons.manage_search_rounded;
        } else if (element['group'] == "Completed") {
          stringColor = Color(0xff20b24d);
          iconGroup = Icons.check_circle_outline_outlined;
        } else if (element['group'] == "Follow Up") {
          stringColor = Colors.red;
          iconGroup = Icons.timelapse_rounded;
        }
        return Card(
          elevation: 5.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            leading: CircleAvatar(
              radius: 22.0,
              backgroundImage: NetworkImage(element['image']),
              backgroundColor: Colors.green,
            ),
            title: Text(
              element['title'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: 'Helvetica',
                  color: Color(0xff1d1d1d),
                  fontWeight: FontWeight.normal,
                  fontSize: 16.0,
                  letterSpacing: 1.5),
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Subject: ",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 1.5),
                      ),
                      TextSpan(
                        text: element['subject'] + "\n",
                        style: TextStyle(
                            fontFamily: 'Helvetica',
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 1.5),
                      ),
                      WidgetSpan(
                        child: Icon(
                          iconGroup,
                          size: 20,
                          color: stringColor,
                        ),
                      ),
                      TextSpan(
                        text: " " + element['group'],
                        style: TextStyle(
                            fontFamily: 'Trueno1',
                            color: stringColor,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.0,
                            letterSpacing: 1.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            trailing: Icon(Icons.arrow_forward),
          ),
        );
      },
    );
  }
  // old List view
  // Widget listViewBuild() {
  //   return ListView.builder(
  //       itemCount: 5,
  //       itemBuilder: (context, index) {
  //         return Card(
  //           child: ListTile(
  //             title: RichText(
  //               text: TextSpan(
  //                 children: [
  //                   TextSpan(
  //                     text: "Suzy ",
  //                     style: TextStyle(
  //                         fontFamily: 'Trueno',
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 16.0),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             subtitle: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text('Subject: Mathematics Biology'),
  //                 RichText(
  //                   text: TextSpan(
  //                     children: [
  //                       WidgetSpan(
  //                         child: Icon(
  //                           Icons.check_circle_outline_outlined,
  //                           size: 19,
  //                           color: Colors.green,
  //                         ),
  //                       ),
  //                       TextSpan(
  //                         text: " 360 Checked ",
  //                         style: TextStyle(
  //                             fontFamily: 'Trueno1',
  //                             color: Colors.grey,
  //                             fontWeight: FontWeight.normal,
  //                             fontSize: 12.0),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             leading: CircleAvatar(
  //               radius: 22.0,
  //               backgroundImage: NetworkImage(
  //                   "https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
  //               backgroundColor: Colors.transparent,
  //             ),
  //             onTap: () {
  //               //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FruitDetail(fruitDataModel: Fruitdata[index],)));
  //             },
  //           ),
  //         );
  //       });
  // }
}
