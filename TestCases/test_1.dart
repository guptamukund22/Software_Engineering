import 'package:recipe_teller/test.dart';
import 'package:recipe_teller/authentication/user_add.dart'; // Import the User class from the appropriate location

void main() {
  group('User class tests', () {
    test('User toJson() test', () {
      // Arrange
      final user = User(username: 'testUser', mailid: 'test@example.com');

      // Act
      final json = user.toJson();

      // Assert
      expect(json, isMap);
      expect(json['Username'], equals('testUser'));
      expect(json['mailid'], equals('test@example.com'));
    });

    test('User object equality test', () {
      // Arrange
      final user1 = User(username: 'testUser', mailid: 'test@example.com');
      final user2 = User(username: 'testUser', mailid: 'test@example.com');
      final user3 =
          User(username: 'anotherUser', mailid: 'another@example.com');

      // Assert
      expect(user1, equals(user2)); // Same properties, so should be equal
      expect(user1,
          isNot(equals(user3))); // Different properties, so should not be equal
    });
  });
}
