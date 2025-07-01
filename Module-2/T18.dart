class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("Deposited: $amount");
  }

  void withdraw(double amount) {
    if (amount > balance) {
      print("Insufficient balance.");
    } else {
      balance -= amount;
      print("Withdrew: $amount");
    }
  }

  void checkBalance() {
    print("Current Balance: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {
  BankAccount account = BankAccount("123456", "Raj", 1000.0);

  account.checkBalance();
  account.deposit(500);
  account.withdraw(300);
  account.withdraw(2000); // Should not allow
  account.checkBalance();
}
