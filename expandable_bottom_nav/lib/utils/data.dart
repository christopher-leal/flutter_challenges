import 'package:expandable_bottom_nav/models/item.dart';
import 'package:faker/faker.dart';

final items = [
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    bg: 'img1.png',
    avatar: 'person1.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    bg: 'img2.png',
    avatar: 'person2.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    bg: 'img3.png',
    avatar: 'person3.png',
  ),
  Item(
    title: faker.person.name(),
    subtitle: faker.lorem.words(3).join(" "),
    bg: 'img4.png',
    avatar: 'person4.png',
  ),
];
