import 'package:flutter/material.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TitledCard(
        key: const Key('details-header'),
        title: 'Details',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextField(
              key: Key('date-field'),
              readOnly: true,
              decoration: InputDecoration(
                hintText: '2020-06-29',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.0),
                  child: Icon(Icons.expand_more),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              key: Key('area-field'),
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select Area',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.0),
                  child: Icon(Icons.expand_more),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              key: Key('task-field'),
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Task Category',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.0),
                  child: Icon(Icons.expand_more),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              key: Key('tags-field'),
              decoration: InputDecoration(
                hintText: 'Tags',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.0,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
