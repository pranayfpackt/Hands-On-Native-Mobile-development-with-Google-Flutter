import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hands_on_layouts/favor.dart';
import 'package:hands_on_layouts/friend.dart';
import 'package:hands_on_layouts/mock_values.dart';
import 'package:flutter/services.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: RequestFavorPage( // uncomment this and comment 'home' below to change the visible page for now
      //   friends: mockFriends,
      // ),
      home: FavorsPage(
        pendingAnswerFavors: mockPendingFavors,
        completedFfavors: mockCompletedFavors,
        refusedFavors: mockRefusedFavors,
        acceptedFavors: mockDoingFavors,
      ),
    );
  }
}

class FavorsPage extends StatelessWidget {
  // using mock values from mock_favors dart file for now
  final List<Favor> pendingAnswerFavors;
  final List<Favor> acceptedFavors;
  final List<Favor> completedFfavors;
  final List<Favor> refusedFavors;

  FavorsPage({
    Key key,
    this.pendingAnswerFavors,
    this.acceptedFavors,
    this.completedFfavors,
    this.refusedFavors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your favors"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 46.0,
            alignment: Alignment.center,
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  FavorCategoryChip(title: "Requests"),
                  FavorCategoryChip(title: "Doing"),
                  FavorCategoryChip(title: "Completed"),
                  FavorCategoryChip(title: "Refused"),
                ]),
          ),
          Expanded(
            child: ListView(
              children: [
                FavorsList(title: "Requests", favors: pendingAnswerFavors),
                FavorsList(title: "Doing", favors: acceptedFavors),
                FavorsList(title: "Completed", favors: completedFfavors),
                FavorsList(title: "Refused", favors: refusedFavors),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Ask a favor',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FavorCategoryChip extends StatelessWidget {
  final String title;

  const FavorCategoryChip({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: ValueKey(title),
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(title),
      ),
    );
  }
}

class FavorsList extends StatelessWidget {
  final String title;
  final List<Favor> favors;

  const FavorsList({Key key, this.title, this.favors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(title),
        ListView.builder(
          shrinkWrap: true,

          physics:
              NeverScrollableScrollPhysics(), // nested list views do not disturb with scroll, so the
          // parent listview controls the scroll
          itemCount: favors.length,
          itemBuilder: (BuildContext context, int index) {
            final favor = favors[index];
            return FavorCardItem(
              favor: favor,
            );
          },
        ),
      ],
    );
  }
}

class FavorCardItem extends StatelessWidget {
  final Favor favor;

  const FavorCardItem({Key key, this.favor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(favor.uuid),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: Padding(
        child: Column(
          children: <Widget>[
            _itemHeader(favor),
            Text(favor.description),
            _itemActions(favor)
          ],
        ),
        padding: EdgeInsets.all(8.0),
      ),
    );
  }

  Widget _itemActions(Favor favor) {
    return favor.isRequested
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Refuse"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("Do"),
                onPressed: () {},
              )
            ],
          )
        : favor.isDoing
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text("give up"),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text("complete"),
                    onPressed: () {},
                  )
                ],
              )
            : Container();
  }

  Widget _itemHeader(Favor favor) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            favor.friend.photoURL,
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text("${favor.friend.name} asked you to... ")),
        )
      ],
    );
  }
}

class RequestFavorPage extends StatelessWidget {
  List<Friend> friends;

  RequestFavorPage({Key key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requesting a favor"),
        leading: CloseButton(),
        actions: <Widget>[
          FlatButton(
              child: Text("SAVE"), textColor: Colors.white, onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Request a favor to:"),
            DropdownButtonFormField(
              items: friends
                  .map(
                    (f) => DropdownMenuItem(
                          child: Text(f.name),
                        ),
                  )
                  .toList(),
            ),
            Container(
              height: 16.0,
            ),
            Text("Favor description:"),
            TextFormField(
              maxLines: 5,
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
            ),
            Container(
              height: 16.0,
            ),
            Text("Due Date:"),
            DateTimePickerFormField(
              inputType: InputType.both,
              format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
              editable: false,
              decoration: InputDecoration(
                  labelText: 'Date/Time', hasFloatingPlaceholder: false),
              onChanged: (dt) {},
            ),
          ],
        ),
      ),
    );
  }
}
