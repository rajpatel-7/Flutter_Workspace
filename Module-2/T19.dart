class Vehicle {
  void displayInfo() {
    print("General vehicle information.");
  }
}

class Car extends Vehicle {
  @override
  void displayInfo() {
    print("Vehicle Type: Car");
    print("Fuel Type: Petrol");
    print("Max Speed: 220 km/h");
  }
}

class Bike extends Vehicle {
  @override
  void displayInfo() {
    print("Vehicle Type: Bike");
    print("Fuel Type: Petrol");
    print("Max Speed: 150 km/h");
  }
}

void main() {
  Car myCar = Car();
  Bike myBike = Bike();

  print("Car Details:");
  myCar.displayInfo();

  print("\nBike Details:");
  myBike.displayInfo();
}
