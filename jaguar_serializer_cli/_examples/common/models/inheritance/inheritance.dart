import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'inheritance.jser.dart';

abstract class Mixin {
  String mixed;
}

class Base {
  String based;

  Base();

  Base.make({this.based});
}

class Derived extends Base with Mixin {
  String derived;
  Derived({this.derived, String based, String mixed}) {
    this.based = based;
    this.mixed = mixed;
  }
  bool operator ==(final other) {
    if (other is Derived)
      return mixed == other.mixed &&
          based == other.based &&
          derived == other.derived;
    return false;
  }
}

@GenSerializer(
  fields: const {
    'mixed': const EnDecode(alias: 'm'),
    'based': const EnDecode(alias: 'b'),
  },
)
class DerivedSerializer extends Serializer<Derived> with _$DerivedSerializer {}