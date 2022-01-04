// ignore_for_file: file_names

import 'package:edcheckv2/screens/student/student_add_assignment.dart';
import 'package:edcheckv2/screens/student/student_assignment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grouped_list/grouped_list.dart';

class StudentDashboard extends StatefulWidget {
  @override
  _StudentDashboard createState() => new _StudentDashboard();
}

class _StudentDashboard extends State<StudentDashboard> {
  List _foundAssignment = [];
  List assignments = [
    {
      'id': '1',
      'title': 'Biology Chapter 1 Biology Chapter 1',
      'subject': 'Biology',
      'status': '1',
      'submitted': 'Today, 3:00 PM',
      'checkerName': 'John',
      'checkerImage':
          'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80',
    },
    {
      'id': '2',
      'title': 'Mathematics Chapter 2',
      'subject': 'Mathematics',
      'status': '2',
      'submitted': 'Today, 9:00 AM',
      'checkerName': 'Will',
      'checkerImage':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    },
    {
      'id': '3',
      'title': 'Mathematics Chapter 3',
      'subject': 'Mathematics',
      'status': '3',
      'submitted': 'Yesterday, 11:00 PM',
      'checkerName': 'Mike',
      'checkerImage':
          'https://images.unsplash.com/photo-1621905252472-943afaa20e20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
    },
    {
      'id': '4',
      'title': 'Physics Chapter 1',
      'subject': 'Physics',
      'status': '4',
      'submitted': 'Today, 8:00 AM',
      'checkerName': 'Miranda',
      'checkerImage':
          'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    },
    {
      'id': '5',
      'title': 'Chemistry Chapter 3',
      'subject': 'Chemistry',
      'status': '1',
      'submitted': 'Yesterday, 5:00 PM',
      'checkerName': 'Beth',
      'checkerImage':
          'https://images.unsplash.com/photo-1551836022-deb4988cc6c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    },
  ];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundAssignment = assignments;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = assignments;
    } else {
      results = assignments
          .where((value) => value["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundAssignment = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.green,
            icon: Icon(Icons.create_rounded),
            label: Text(
              'Add Assignment',
              style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentAddAssignment(),
                  ));
            },
          ),
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome\n",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        letterSpacing: 1.5),
                  ),
                  WidgetSpan(
                      child: SizedBox(
                    height: 10,
                  )),
                  TextSpan(
                    text: "John McLarin",
                    style: TextStyle(
                        fontFamily: 'Helvetica',
                        color: Color(0xff20b24d),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        letterSpacing: 1.5),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.notifications_none_rounded,
                      size: 26.0,
                    ),
                  )),
            ],
            foregroundColor: Colors.grey,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 00,
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Search for Assignment',
                      style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      '.',
                      style: TextStyle(
                          color: Color(0xff20b24d),
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: 2),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Color(0xfff9f9f9),
                      filled: true,
                      labelText: 'Search',
                      labelStyle: TextStyle(
                          fontFamily: 'Helvetica',
                          fontWeight: FontWeight.normal,
                          fontSize: 13.0,
                          letterSpacing: 2.0),
                      prefixIcon: Icon(
                        Icons.search,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: _foundAssignment.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Latest Added (" +
                                    assignments.length.toString() +
                                    ")",
                                style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    color: Color(0xff1d1d1d),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                    letterSpacing: 2.0),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: _foundAssignment.length,
                                  itemBuilder: (context, index) {
                                    Color stringColor = Colors.grey;
                                    String? status;
                                    IconData iconGroup =
                                        Icons.hourglass_bottom_rounded;
                                    if (_foundAssignment[index]['status'] ==
                                        "1") {
                                      stringColor = Colors.blue;
                                      iconGroup =
                                          Icons.hourglass_bottom_rounded;
                                      status = "Unchecked";
                                    } else if (_foundAssignment[index]
                                            ['status'] ==
                                        "2") {
                                      stringColor = Colors.orange;
                                      iconGroup = Icons.manage_search_rounded;
                                      status = "In Review";
                                    } else if (_foundAssignment[index]
                                            ['status'] ==
                                        "3") {
                                      stringColor = Color(0xff20b24d);
                                      iconGroup =
                                          Icons.check_circle_outline_outlined;
                                      status = "Completed";
                                    } else if (_foundAssignment[index]
                                            ['status'] ==
                                        "4") {
                                      stringColor = Colors.red;
                                      iconGroup = Icons.timelapse_rounded;
                                      status = "Follow up";
                                    }
                                    return Card(
                                      elevation: 5,
                                      key: ValueKey(
                                          _foundAssignment[index]['id']),
                                      child: ListTile(
                                        title: RichText(
                                          overflow: TextOverflow.ellipsis,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: _foundAssignment[index]
                                                        ["title"]
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Helvetica',
                                                    color: Color(0xff1d1d1d),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontSize: 16.0,
                                                    letterSpacing: 1.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Submitted: ",
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color:
                                                            Color(0xff1d1d1d),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        _foundAssignment[index]
                                                                ["submitted"]
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color:
                                                            Color(0xff1d1d1d),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              overflow: TextOverflow.ellipsis,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Subject: ",
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color:
                                                            Color(0xff1d1d1d),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        _foundAssignment[index]
                                                                ["subject"]
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: "Status: ",
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color:
                                                            Color(0xff1d1d1d),
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                  TextSpan(
                                                    text: status,
                                                    style: TextStyle(
                                                        fontFamily: 'Helvetica',
                                                        color: stringColor,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.0,
                                                        letterSpacing: 1.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        leading: (_foundAssignment[index]
                                                    ['status'] ==
                                                "1")
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Icon(
                                                    Icons
                                                        .hourglass_bottom_rounded,
                                                    color: Colors.blue),
                                              )
                                            : SizedBox(
                                                child: CircleAvatar(
                                                  radius: 22.0,
                                                  backgroundColor: Colors.white,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            stringColor,
                                                        radius: 10.0,
                                                        child: Icon(
                                                          iconGroup,
                                                          size: 12.0,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    radius: 38.0,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      _foundAssignment[index]
                                                              ["checkerImage"]
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StudentAssignmentDetails(),
                                              ));
                                        },
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        )
                      : Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "No results found",
                            style: TextStyle(
                                fontFamily: 'Helvetica',
                                color: Color(0xff1d1d1d),
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                letterSpacing: 2.0),
                          ),
                        ),
                ),
              ],
            ),
          )),
    );
  }

  // Widget listViewBuild() {
  //   return GroupedListView<dynamic, String>(
  //     elements: assignments,
  //     groupBy: (element) => element['group'],
  //     groupComparator: (value1, value2) => value2.compareTo(value1),
  //     itemComparator: (item1, item2) =>
  //         item1['title'].compareTo(item2['title']),
  //     order: GroupedListOrder.ASC,
  //     useStickyGroupSeparators: true,
  //     stickyHeaderBackgroundColor: Colors.white,
  //     groupSeparatorBuilder: (String value) {
  //       Color stringColor = Colors.grey;

  //       if (value == "In Review") {
  //         stringColor = Colors.orange;
  //       } else if (value == "Completed") {
  //         stringColor = Color(0xff20b24d);
  //       } else if (value == "Follow Up") {
  //         stringColor = Colors.red;
  //       }
  //       return Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: RichText(
  //           text: TextSpan(
  //             children: [
  //               TextSpan(
  //                 text: "$value ",
  //                 style: TextStyle(
  //                     fontFamily: 'Helvetica',
  //                     color: Color(0xff1d1d1d),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 15.0,
  //                     letterSpacing: 2.0),
  //               ),
  //               TextSpan(
  //                 text: "()",
  //                 style: TextStyle(
  //                     fontFamily: 'Helvetica',
  //                     color: stringColor,
  //                     fontWeight: FontWeight.normal,
  //                     fontSize: 15.0),
  //               ),
  //             ],
  //           ),
  //           textAlign: TextAlign.start,
  //         ),
  //       );
  //     },
  //     itemBuilder: (c, element) {
  //       Color stringColor = Colors.grey;
  //       IconData iconGroup = Icons.info;
  //       if (element['group'] == "In Review") {
  //         stringColor = Colors.orange;
  //         iconGroup = Icons.manage_search_rounded;
  //       } else if (element['group'] == "Completed") {
  //         stringColor = Color(0xff20b24d);
  //         iconGroup = Icons.check_circle_outline_outlined;
  //       } else if (element['group'] == "Follow Up") {
  //         stringColor = Colors.red;
  //         iconGroup = Icons.timelapse_rounded;
  //       }
  //       return Card(
  //         elevation: 5.0,
  //         margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
  //         child: Container(
  //           child: ListTile(
  //             contentPadding:
  //                 EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //             leading: CircleAvatar(
  //               radius: 22.0,
  //               backgroundImage: NetworkImage(element['image']),
  //               backgroundColor: Colors.transparent,
  //             ),
  //             title: Text(
  //               element['title'],
  //               style: TextStyle(
  //                   fontFamily: 'Helvetica',
  //                   color: Color(0xff1d1d1d),
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 16.0,
  //                   letterSpacing: 1.0),
  //             ),
  //             subtitle: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 RichText(
  //                   text: TextSpan(
  //                     children: [
  //                       TextSpan(
  //                         text: "Subject: ",
  //                         style: TextStyle(
  //                             fontFamily: 'Helvetica',
  //                             color: Colors.grey,
  //                             fontWeight: FontWeight.normal,
  //                             fontSize: 14.0),
  //                       ),
  //                       TextSpan(
  //                         text: element['subject'] + "\n",
  //                         style: TextStyle(
  //                             fontFamily: 'Helvetica',
  //                             color: Colors.black,
  //                             fontWeight: FontWeight.normal,
  //                             fontSize: 14.0),
  //                       ),
  //                       WidgetSpan(
  //                         child: Icon(
  //                           iconGroup,
  //                           size: 20,
  //                           color: stringColor,
  //                         ),
  //                       ),
  //                       TextSpan(
  //                         text: " " + element['group'],
  //                         style: TextStyle(
  //                             fontFamily: 'Trueno1',
  //                             color: stringColor,
  //                             fontWeight: FontWeight.normal,
  //                             fontSize: 14.0),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             trailing: Icon(Icons.arrow_forward),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
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
