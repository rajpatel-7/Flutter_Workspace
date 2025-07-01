class Book {
  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  void displayDetails() {
    print("Title: $title");
    print("Author: $author");
    print("Publication Year: $year");
  }

  bool isOverTenYearsOld() {
    int currentYear = DateTime.now().year;
    return (currentYear - year) > 10;
  }
}

void main() {
  Book b = Book("The Alchemist", "Paulo Coelho", 2005);
  b.displayDetails();

  if (b.isOverTenYearsOld()) {
    print("This book is over 10 years old.");
  } else {
    print("This book is less than 10 years old.");
  }
}
