const apiHost = "avencia.skomarov.com";

const transferEndpoint = "/v1/app/transfer";
const getUserInfoEndpoint = "/v1/app/user";
const historyEndpoint = "/v1/app/history";
const userDetailsEndpoint = "/v1/app/user/details";
const addressEndpoint = "/v1/app/user/address";

const passportEndpoint = "/v1/app/user/kyc/passport";
const passportStatusEndpoint = "$passportEndpoint/status";
const passportBackEndpoint = "$passportEndpoint/back";
const passportFrontEndpoint = "$passportEndpoint/front";

const nationalIdEndpoint = "/v1/app/user/kyc/nationalId";
const nationalIdStatusEndpoint = "$nationalIdEndpoint/status";
const nationalIdBackEndpoint = "$nationalIdEndpoint/back";
const nationalIdFrontEndpoint = "$nationalIdEndpoint/front";

const drivingLicenseEndpoint = "/v1/app/user/kyc/drivingLicense";
const dlStatusEndpoint = "$drivingLicenseEndpoint/status";
const dlBackEndpoint = "$drivingLicenseEndpoint/back";
const dlFrontEndpoint = "$drivingLicenseEndpoint/front";

const genTransactionCodeEndpoint = "/v1/app/gen-transaction-code";

const createWalletEndpoint = "/v1/app/wallets";
const getWalletsEndpoint = "/v1/app/wallets";

const getExchangeRatesEndpoint = "/v1/app/exchange-rates";
