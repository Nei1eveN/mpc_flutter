import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mpc_flutter/src/features/diary/diary.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

class NewDiaryPage extends StatelessWidget {
  const NewDiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DiaryCubit, DiaryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              leading: IconButton(
                onPressed: () {},
                splashColor: Colors.transparent,
                splashRadius: 20.0,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'New Diary',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            body: ListView(
              children: [
                const LocationSection(
                  location: '20041075 | TAP-NS TAP-North Strathfield',
                ),
                const HelpSection(),
                AddPhotosSection(
                  onPressed: state.isLoading
                      ? null
                      : context.read<DiaryCubit>().addImage,
                  images: state.imagePaths,
                  onRemoveFile: context.read<DiaryCubit>().removeImage,
                ),
                const SizedBox(height: 20.0),
                const CommentsSection(),
                const SizedBox(height: 20.0),
                const DetailsSection(),
                const SizedBox(height: 20.0),
                LinkEventSection(
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20.0),
                GreenButton(
                  title: 'Next',
                  isLoading: state.isLoading,
                  onPressed: state.imagePaths.isEmpty
                      ? null
                      : () {
                          context
                              .read<DiaryCubit>()
                              .uploadImages(state.imagePaths);
                        },
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        });
  }
}
