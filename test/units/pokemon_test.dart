import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';

void main() {
  group("Pokemon creation", () {
    test(
      "should be able to return a pokemon's name",
      () {
        final pokemon =
            Pokemon(id: 1, name: "pokemon-name", imageUrl: "imageUrl");
        expect(pokemon.name, "pokemon-name");
      },
    );
    test(
      "should not be able to create a pokemon with an empty imageUrl",
      () {
        expect(
          () => Pokemon(id: 1, name: "pokemon-name", imageUrl: ""),
          throwsAssertionError,
        );
      },
    );
    test(
      "should not be able to create a pokemon with an empty name",
      () {
        expect(
          () => Pokemon(id: 1, name: "", imageUrl: "imageUrl"),
          throwsAssertionError,
        );
      },
    );
  });
  group("Pokemon methods", () {
    test(
      "should be able to return an Color based on pokemon's color attribute",
      () {
        final pokemon = Pokemon(
          id: 1,
          name: "pokemon-name",
          imageUrl: "imageUrl",
          color: "green",
        );
        expect(
          pokemon.getColor,
          isSameColorAs(Colors.green[300]!),
        );
      },
    );
    test(
      "should be able to return an Color default when pokemon's color attribute is not found",
      () {
        final pokemon = Pokemon(
          id: 1,
          name: "pokemon-name",
          imageUrl: "imageUrl",
          color: "color-not-found",
        );
        expect(
          pokemon.getColor,
          isSameColorAs(Colors.grey[400]!),
        );
      },
    );
  });
}
