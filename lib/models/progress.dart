import 'package:freezed_annotation/freezed_annotation.dart';

import 'finished_state.enum.dart';

part 'progress.freezed.dart';

@freezed
class Progress with _$Progress {
  factory Progress.finished(FINISHED_STATE winner) = Finished;
  factory Progress.inProgress() = InProgress;
}
