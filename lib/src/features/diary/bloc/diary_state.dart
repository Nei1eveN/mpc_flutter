import 'dart:io';

import 'package:equatable/equatable.dart';

class DiaryState extends Equatable {
  final bool isLoading;
  final List<File> imagePaths;
  final Exception? uploadError;

  const DiaryState._({
    required this.imagePaths,
    required this.isLoading,
    required this.uploadError,
  });

  factory DiaryState.initial() {
    return const DiaryState._(
      imagePaths: [],
      isLoading: false,
      uploadError: null,
    );
  }

  DiaryState copyWith({
    List<File>? imagePaths,
    bool? isLoading,
    Exception? uploadError,
  }) {
    return DiaryState._(
      imagePaths: imagePaths ?? this.imagePaths,
      isLoading: isLoading ?? this.isLoading,
      uploadError: uploadError,
    );
  }

  @override
  List<Object?> get props => [imagePaths, isLoading, uploadError];
}
