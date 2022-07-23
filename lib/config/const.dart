const apiHost = "avencia.skomarov.com";

const getLimitsEndpoint = "/api/v1/funds/limits";

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
