// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class CheckerList extends StatefulWidget {
  @override
  _CheckerList createState() => new _CheckerList();
}

class _CheckerList extends State<CheckerList> {
  List checkerList = [
    {
      'name': 'John',
      'group': 'All',
      'subject': 'Physics',
      'degree': 'Ph.D in Physics and Mathematics',
      'background':
          'Hi! My name is John and I love teaching Physics. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1607990281513-2c110a25bd8c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=934&q=80'
    },
    {
      'name': 'Will',
      'group': 'All',
      'subject': 'Mathematics  ',
      'degree': 'Ph.D in Mathematics',
      'background':
          'Hi! My name is Will and I love teaching Physics. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    },
    {
      'name': 'Beth',
      'group': 'All',
      'subject': 'Biology',
      'degree': 'Ph.D in Biology',
      'background':
          'Hi! My name is Beth and I love teaching Physics. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1551836022-deb4988cc6c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Miranda',
      'group': 'All',
      'subject': 'Mathematics',
      'degree': 'Ph.D in Mathematics ',
      'background':
          'Hi! My name is Miranda and I love teaching Physics. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1573497019940-1c28c88b4f3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
    {
      'name': 'Mike',
      'group': 'All',
      'subject': 'Biology',
      'degree': 'Ph.D in Physics',
      'background':
          'Hi! My name is Mike and I love teaching Biology. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1621905252472-943afaa20e20?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80'
    },
    {
      'name': 'Danny',
      'group': 'All',
      'subject': 'Physics',
      'degree': 'Ph.D in Physics',
      'background':
          'Hi! My name is Danny and I love teaching Physics. I have completed my Ph.D from University of Chicago, and currently I teach at the University of Southern California. Nice to meet you!',
      'image':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 10),
          child: DefaultTabController(
              length: 7,
              child: Column(
                children: <Widget>[
                  Material(
                      color: Colors.white,
                      child: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xff20b24d),
                        indicatorColor: Colors.green,
                        isScrollable: true,
                        padding: EdgeInsets.fromLTRB(10, 0, 30, 0),
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
                              'Physics',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Algebra',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Chemistry',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Biology',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'Geometry',
                              style: TextStyle(
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  letterSpacing: 2.0),
                            ),
                          ),
                          Tab(
                            child: Text(
                              'General Science',
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
                        Text('Physics'),
                        Text('Algebra'),
                        Text('Chemistry'),
                        Text('Biology'),
                        Text('Geometry'),
                        Text('General Science'),
                      ],
                    ),
                  )
                ],
              )),
        ) // This trailing comma m
        );
  }

  Widget listViewBuild() {
    String count = checkerList.length.toString();
    return GroupedListView<dynamic, String>(
      elements: checkerList,
      groupBy: (element) => element['group'],
      groupComparator: (value1, value2) => value2.compareTo(value1),
      itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      stickyHeaderBackgroundColor: Colors.white,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  text: "$value available Checkers ",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      letterSpacing: 2.0)),
              TextSpan(
                  text: "($count)",
                  style: TextStyle(
                      fontFamily: 'Helvetica',
                      color: Color(0xff20b24d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      letterSpacing: 2.0)),
            ],
          ),
          textAlign: TextAlign.start,
        ),
      ),
      itemBuilder: (c, element) {
        return Card(
          elevation: 5.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(element['image']),
                backgroundColor: Colors.green,
              ),
              title: Text(
                element['name'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: 'Helvetica',
                    color: Color(0xff1d1d1d),
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    letterSpacing: 2),
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
                          text: element['subject'],
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(
                            Icons.check_circle_outline_outlined,
                            size: 19,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: " 360 Checked ",
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                              letterSpacing: 1.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Divider(
                            height: 1,
                            thickness: 4,
                            indent: 150,
                            endIndent: 150,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 15.0),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0xffe9f8ee),
                            child: CircleAvatar(
                              backgroundColor: Color(0xffe9f8ee),
                              radius: 50,
                              backgroundImage: NetworkImage(element['image']),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            element['name'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff1d1d1d),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal,
                                fontSize: 20.0,
                                letterSpacing: 2),
                          ),
                          SizedBox(height: 2.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                                primary: Color(0xff20b24d),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 0),
                                textStyle: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18.0,
                                )),
                            onPressed: () {},
                            child: Text(
                              element['degree'],
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            element['background'],
                            style: TextStyle(
                                color: Color(0xff1d1d1d),
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                                letterSpacing: 2),
                          ),
                          SizedBox(height: 50.0),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
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
