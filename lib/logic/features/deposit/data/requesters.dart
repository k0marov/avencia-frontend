import 'dart:convert';

import 'package:avencia/logic/core/auth_http_client.dart';
import 'package:avencia/logic/core/endpoints.dart';
import 'package:avencia/logic/features/deposit/domain/contracts.dart';

import 'mappers.dart';

// TODO: split AuthFacade into usecases

DepositCodeRequester newDepositCodeRequester(AuthHTTPClient httpClient, TransactionCodeMapper codeMapper) => () async {
      final response = await httpClient.get(depositGenerateCodeEndpoint().toURL(apiHost));
      print(response.body);
      return codeMapper.fromJson(json.decode(response.body));
    };
