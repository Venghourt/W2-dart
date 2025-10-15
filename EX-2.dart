import 'dart:io';

class BankAccount {
  // TODO
  final int _accountNumber;
  final int _accountPassword;
  final String _accountOwner;
  double _currentBalance = 1000;

  BankAccount(this._accountNumber, this._accountPassword, this._accountOwner);

  int get accountNumber => _accountNumber;
  int get accountPassword => _accountPassword;

  @override
  String toString() {
    return 'Account: $_accountNumber, Password: $_accountPassword, Owner: $_accountOwner';
  }

  double balance() {
    return _currentBalance;
  }

  double withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError('The amount has to be above zero');
    }
    if (amount > _currentBalance) {
      throw ArgumentError('The amount is greater than the current balance');
    }
    _currentBalance -= amount;
    print("Successful withdrawal of \$$amount");
    return _currentBalance;
  }

  double credit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('The amount has to be above zero');
    }

    _currentBalance += amount;
    print("Successfully credited \$$amount");
    return _currentBalance;
  }
}

class Bank {
  // TODO
  final String _name;
  final List<BankAccount> _accounts = [];

  Bank(this._name);

  String get name => _name;
  List<BankAccount> get accounts => _accounts;

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
      if (account.accountNumber == accountId) {
        throw ArgumentError('Account is already exist!');
      }
    }
    var password = accountId + 1234;
    var newAccount = BankAccount(accountId, password, accountOwner);
    _accounts.add(newAccount);
    stdout.write('Successfully added!');
    return newAccount;
  }
}

void main() {
  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print("Balance: \$${ronanAccount.balance()}");
  ronanAccount.credit(100);
  print("Balance: \$${ronanAccount.balance()}");
  ronanAccount.withdraw(50);
  print("Balance: \$${ronanAccount.balance()}");

  try {
    ronanAccount.withdraw(75);
  } catch (e) {
    print(e);
  }

  try {
    myBank.createAccount(100, 'Honlgy'); 
  } catch (e) {
    print(e);
  }
}