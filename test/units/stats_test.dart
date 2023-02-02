import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';

void main() {
  group("Stats creation", () {
    test(
      "should be able to return a stats's title",
      () {
        final stats = Stats(title: "hp", stat: 10);
        expect(stats.title, "hp");
      },
    );
    test(
      "should not be able to create a stats with an empty title",
      () {
        expect(
          () => Stats(title: "", stat: 10),
          throwsAssertionError,
        );
      },
    );
    test(
      "should not be able to create a stats with stat less than 0",
      () {
        expect(
          () => Stats(title: "hp", stat: -1),
          throwsAssertionError,
        );
      },
    );
  });
  group("Stats methods", () {
    test(
      "should be able to return an abreviated and uppercase title based on stats's title attribute",
      () {
        final stats = Stats(title: "special-attack", stat: 10);
        expect(stats.initials, "SP.ATK");
      },
    );
    test(
      "should be able to return an string value on initials method when title is not found",
      () {
        final stats = Stats(title: "non-found-title", stat: 10);
        expect(stats.initials, "");
      },
    );
  });
}
