class ResultCalculation {
  var hcp;
  var par;
  var stroke;
  var score;

  int _result = 0;

  ResultCalculation(this.hcp, this.par, this.stroke, this.score);

  String calculateResult() {
    if (score > 0) {
      if (hcp >= 18) {
        int calc = hcp - 18;
        if (stroke <= calc) {
          _result = (3 + (par - score)) + 1;
        } else {
          _result = (3 + (par - score));
        }
      } else if (hcp < stroke) {
        _result = (2 + (par - score));
      } else {
        _result = (3 + (par - score));
      }

      if (_result <= 0) {
        _result = 0;
      }
    } else {
      _result = 0;
    }
    return _result.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (_result == (par - 1)) {
      return 'Good job you got a birdie ';
    } else if (score == (par - 2)) {
      return 'Great job you got an Eagle !!!';
    } else if (score == (par - 3)) {
      return 'Excellent you got an albertros';
    } else if (score == par) {
      return 'Not bad you got a Par';
    } else if (score == (par + 1)) {
      return 'You got a Bogey';
    } else if (score == (par + 1)) {
      return 'You got a Double Bogey';
    } else {
      return 'You have scored 0!!!';
    }
  }
}
