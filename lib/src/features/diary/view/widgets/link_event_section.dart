import 'package:flutter/material.dart';
import 'package:mpc_flutter/generated/assets/colors.gen.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

class LinkEventSection extends StatelessWidget {
  final bool checkboxValue;
  final ValueChanged<bool?>? onChanged;

  const LinkEventSection({
    super.key,
    this.checkboxValue = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TitledCard(
        title: 'Link to existing event?',
        titlePartner: Checkbox(
          value: checkboxValue,
          onChanged: onChanged,
          activeColor: ColorName.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
        ),
        child: Column(
          children: const [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Select an event',
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
          ],
        ),
      ),
    );
  }
}
