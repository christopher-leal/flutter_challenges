import 'package:expandable_bottom_nav/models/item.dart';
import 'package:faker/faker.dart';

const _bgs = [
  'img1.png',
  'img2.png',
  'img3.png',
  'img4.png',
];
const _avatars = [
  'person1.png',
  'person2.png',
  'person3.png',
  'person4.png',
];

List<Item> get fakerItems {
  final faker = Faker();
  return List.generate(
    _bgs.length,
    (index) => Item(
      title: faker.person.name(),
      subtitle: faker.lorem.words(3).join(" "),
      avatar: _avatars[index],
      bg: _bgs[index],
    ),
  );
}
