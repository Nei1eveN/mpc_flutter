import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

class AddPhotosSection extends StatelessWidget {
  final VoidCallback? onPressed;

  final bool isLoading;

  final List<File> images;
  final ValueChanged<File> onRemoveFile;

  final bool includePhotoGallery;
  final ValueChanged<bool?>? onIncludeChanged;

  const AddPhotosSection({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.images = const [],
    required this.onRemoveFile,
    this.includePhotoGallery = true,
    this.onIncludeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TitledCard(
        title: 'Add Photos to site diary',
        child: Column(
          children: [
            if (images.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: images.map(
                    (file) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              top: 8.0,
                              bottom: 8.0,
                            ),
                            child: Image.file(
                              file,
                              height: 60.0,
                              width: 60.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            left: 36.0,
                            top: -15.0,
                            child: IconButton(
                              onPressed: () => onRemoveFile(file),
                              iconSize: 20.0,
                              icon: const DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
            const SizedBox(height: 20.0),
            GreenButton(
              title: 'Add a photo',
              onPressed: onPressed,
              isLoading: isLoading,
              buttonPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 20.0),
            TitledCheckbox(
              title: 'Include in photo gallery',
              fontSize: 14.0,
              checkboxValue: includePhotoGallery,
              onChanged: onIncludeChanged,
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
