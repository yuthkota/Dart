class MyDuration {
  final int _milliseconds;

  MyDuration._(this._milliseconds) : assert(_milliseconds >= 0);

  factory MyDuration.fromHours(int hours) {
    return MyDuration._(hours * 3600 * 1000);
  }

  factory MyDuration.fromMinutes(int minutes) {
    return MyDuration._(minutes * 60 * 1000);
  }

  factory MyDuration.fromSeconds(int seconds) {
    return MyDuration._(seconds * 1000);
  }

  bool operator >(MyDuration other) {
    return this._milliseconds > other._milliseconds;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration._(this._milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    int result = this._milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("Resulting duration cannot be negative");
    }
    return MyDuration._(result);
  }

  @override
  String toString() {
    int Seconds = (_milliseconds / 1000).round();
    int hours = Seconds ~/ 3600;
    int minutes = (Seconds % 3600) ~/ 60;
    int seconds = Seconds % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3);
  MyDuration duration2 = MyDuration.fromMinutes(45);
  
  print(duration1 + duration2);
  print(duration1 > duration2);

  try {
    print(duration2 - duration1);
  } catch (e) {
    print(e);
  }
}
