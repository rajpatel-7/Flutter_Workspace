import 'dart:io';

void main() {
  Map<String, String> addressBook = {};

  while (true) {
    print("\n--- Address Book ---");
    print("1. Add Contact");
    print("2. Update Contact");
    print("3. Remove Contact");
    print("4. View All Contacts");
    print("5. Exit");

    stdout.write("Choose an option: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        stdout.write("Enter name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Enter phone number: ");
        String phone = stdin.readLineSync()!;
        addressBook[name] = phone;
        print("Contact added.");
        break;

      case 2:
        stdout.write("Enter name to update: ");
        String name = stdin.readLineSync()!;
        if (addressBook.containsKey(name)) {
          stdout.write("Enter new phone number: ");
          String newPhone = stdin.readLineSync()!;
          addressBook[name] = newPhone;
          print("Contact updated.");
        } else {
          print("Contact not found.");
        }
        break;

      case 3:
        stdout.write("Enter name to remove: ");
        String name = stdin.readLineSync()!;
        if (addressBook.remove(name) != null) {
          print("Contact removed.");
        } else {
          print("Contact not found.");
        }
        break;

      case 4:
        print("All Contacts:");
        addressBook.forEach((name, phone) {
          print("$name: $phone");
        });
        break;

      case 5:
        print("Exiting...");
        return;

      default:
        print("Invalid option.");
    }
  }
}
