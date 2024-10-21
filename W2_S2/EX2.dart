class InsufficientBalanceException implements Exception {
  String toString() => 'Insufficient balance for withdrawal!';
}

class DuplicateAccountIdException implements Exception {
  String toString() => 'Account with this ID already exists!';
}

// Q1: BankAccount class representing a bank account
class BankAccount {
  int accountId;
  String owner;
  double _balance = 0;

  BankAccount(this.accountId, this.owner);

  // Q2: Method to return the current balance
  double get balance => _balance;

  // Q2: Method to add money to the account
  void credit(double amount) {
    _balance += amount;
  }

  // Q2: Method to withdraw money from the account
  void withdraw(double amount) {
    if (_balance - amount < 0) {
      throw InsufficientBalanceException();
    }
    _balance -= amount;
  }
}

// Q3: Bank class representing a bank that manages multiple accounts
class Bank {
  String name;
  List<BankAccount> _accounts = [];

  Bank({required this.name});

  // Q4: Method to create a new bank account
  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountId == accountId) {
        throw DuplicateAccountIdException();
      }
    }

    BankAccount newAccount = BankAccount(accountId, accountOwner);
    _accounts.add(newAccount);
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with this ID already exists!
  }
}
