class Distance {
  final double _kms;

  const Distance(this._kms);

  Distance.InCms(double cms) : _kms = cms/100000;
  Distance.InMeters(double meters) : _kms = meters/ 1000;
  Distance.InKms(double kms) : _kms = kms;

  Distance operator +(Distance other) {
    return Distance(this._kms + other._kms);
  }

  double get cms => _kms * 100000;
  double get meters => _kms * 1000;
  double get kms => _kms;
}

void main() {
  Distance d1 = Distance.InCms(2000);
  Distance d2 = Distance.InMeters(5);
  Distance d3 = Distance.InKms(2);

  Distance d4 = d2 + d3;
  print(d4.meters);
}
