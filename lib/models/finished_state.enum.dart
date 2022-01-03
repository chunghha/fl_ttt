enum FINISHED_STATE { circle, cross, draw }

extension FinishedStateExtension on FINISHED_STATE {
  String toSubtitle() {
    switch (this) {
      case FINISHED_STATE.circle:
        return 'Circle won!';
      case FINISHED_STATE.cross:
        return 'Cross won!';
      case FINISHED_STATE.draw:
        return 'Neither has won!';
    }
  }

  String toTitle() {
    switch (this) {
      case FINISHED_STATE.circle:
      case FINISHED_STATE.cross:
        return 'We have a winner!';
      case FINISHED_STATE.draw:
        return 'Call it a draw!';
    }
  }
}
