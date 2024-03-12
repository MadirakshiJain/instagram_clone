import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_2/presentation/pages/Profile/widgets/profileview.dart';

import '../profile.dart/profile_view.dart';

class SearchView extends StatefulWidget {
  SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  var searchName = "";

  final List<Map<String, dynamic>> searchUsers = [
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'johndoe',
      'fullName': 'John Doe',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2017/09/26/17/34/ballet-2789416_640.jpg',
      'username': 'janedoe',
      'fullName': 'Jane Doe',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/05/28/05/06/female-4234344_640.jpg',
      'username': 'mikebrown',
      'fullName': 'Mike Brown',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/10/20/08/36/woman-1754895_640.jpg',
      'username': 'emilyjones',
      'fullName': 'Emily Jones',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2019/07/25/10/43/ballerina-4362282_640.jpg',
      'username': 'alexsmith',
      'fullName': 'Alex Smith',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/03/15/17/07/girl-1258727_640.jpg',
      'username': 'sarahwilliams',
      'fullName': 'Sarah Williams',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2016/07/08/23/17/girl-1505407_640.jpg',
      'username': 'davidlee',
      'fullName': 'David Lee',
    },
    {
      'profileImageUrl':
          'https://cdn.pixabay.com/photo/2023/01/01/16/35/street-7690347_640.jpg',
      'username': 'laurajohnson',
      'fullName': 'Laura Johnson',
    },
  ];

  // final Stream<QuerySnapshot> _usersStream =
  //     FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 19, 18, 18),
        // backgroundColor: const Color.fromARGB(255, 36, 35, 35),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: SizedBox(
            height: 40,
            child: 
            
            TextField(
              onChanged: (value) {
                setState(() {
                  searchName = value;
                  // Actions(actions: , child: )
                });
                print(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  filled: true,
                  fillColor: Color.fromARGB(255, 39, 39, 39),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .orderBy("userName")
                .startAt([searchName]).endAt(
                    [searchName + "\uf8ff"]).snapshots(),
            // .collection('users')
            // .where('userName', isGreaterThanOrEqualTo: searchName)
            // .snapshots(),
            builder: (context, snapshot) {
              // FloatingActionButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ProfileView(
              //                 userId: 'userId',
              //               )),
              //     );
              //   },
              // );
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: ((context, index) {
                    var data = snapshot.data!.docs[index];

                    return ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileView(
                              userId: data['id'],
                            ),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(data['profileUrl']),
                      ),
                      title: Text(data['userName']),
                      subtitle: Text(data['email']),
                    );
                  }));
            }));
  }
}
