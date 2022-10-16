const apiHost = "avencia.skomarov.com";

// TODO: update all of the url usages, since now endpoints does NOT contain a trailing slash

const transferEndpoint = "/v1/app/transfer";
const getUserInfoEndpoint = "/v1/app/user";
const historyEndpoint = "/v1/app/history";
const userDetailsEndpoint = "/v1/app/user/details";
const passportEndpoint = "/v1/app/user/kyc/passport";
const passportBackEndpoint = "$passportEndpoint/back";
const passportFrontEndpoint = "$passportEndpoint/front";

const genTransactionCodeEndpoint = "/v1/app/gen-transaction-code";
