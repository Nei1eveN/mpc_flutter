import 'package:flutter/material.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

class CommentsSection extends StatelessWidget {
  final ValueChanged<String?>? onChanged;

  const CommentsSection({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TitledCard(
        key: const Key('comments-header'),
        title: 'Comments',
        child: Column(
          children: [
            TextField(
              key: const Key('comments-textfield'),
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Comments',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
