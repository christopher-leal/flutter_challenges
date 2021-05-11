import 'package:expandable_bottom_nav/models/item.dart';
import 'package:faker/faker.dart';

final items = [
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    avatar: 'img1.png',
    bg: 'person1.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    avatar: 'img2.png',
    bg: 'person2.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    avatar: 'img3.png',
    bg: 'person3.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    avatar: 'img4.png',
    bg: 'person4.png',
  ),
];
