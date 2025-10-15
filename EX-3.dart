class MyDuration {
  int _milliseconds = 0;
  int seconds = 0;
  int minutes = 0;
  int hours = 0;

  MyDuration.fromHours(int hours) {
    if (hours < 0) {
      throw ArgumentError('hours must be bigger than 0');
    }
    _milliseconds = hours * 60 * 60 * 1000;
  }

  MyDuration.fromMinutes(int minute) {
    if (minute < 0) {
      throw ArgumentError('minutes must be bigger than 0');
    }
    _milliseconds = minute * 60 * 1000;
  }

  MyDuration.fromSeconds(int seconds) {
    if (seconds < 0) {
      throw ArgumentError('seconds must be bigger than 0');
    }
    _milliseconds = seconds * 1000;
  }

  MyDuration operator +(MyDuration other) {
    int totalMs = _milliseconds + other._milliseconds;
    int totalSeconds = totalMs ~/ 1000;
    return MyDuration.fromSeconds(totalSeconds);
  }

  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  MyDuration operator -(MyDuration other) {
    int totalMS = _milliseconds - other._milliseconds;
    if (totalMS < 0) {
      throw ArgumentError('Error!');
    }
    return MyDuration.fromSeconds(totalMS);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}