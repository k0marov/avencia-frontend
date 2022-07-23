const apiHost = "avencia.skomarov.com";

const getUserInfoEndpoint = "/api/v1/user-info";

const genTransactionCodeEndpoint = "/api/v1/atm-transaction/gen-code";
const transactionTypeKey = "transaction_type";

enum TransactionType {
  deposit,
  withdrawal,
}

String transactionTypeValue(TransactionType tt) {
  switch (tt) {
    case TransactionType.deposit:
      return "deposit";
    case TransactionType.withdrawal:
      return "withdrawal";
  }
}
