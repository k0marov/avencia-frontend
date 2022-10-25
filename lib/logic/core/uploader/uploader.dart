import 'dart:io';

import 'package:avencia/logic/core/uploader/simple_file.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/errors/errors.dart';
import 'package:helpers/logic/http/auth_http_client.dart';
import 'package:helpers/logic/http/exception_http_client.dart';
import 'package:helpers/logic/http/http.dart';
import 'package:http/http.dart' as http;

const fileUploadField = "file";

// TODO: add progress indication
typedef Uploader = Future<UseCaseRes<void>> Function(String endpoint, SimpleFile file);

// client should add the authentication header
Uploader newUploader(AuthHTTPClientFactory authClient, String apiHost) =>
    (endpoint, file) => withExceptionHandling(() async {
          final request = http.MultipartRequest(HTTPMethods.put, Uri.https(apiHost, endpoint));
          final fileBytes = File(file.path).readAsBytesSync();
          request.files.add(http.MultipartFile.fromBytes(
            fileUploadField,
            fileBytes,
            filename: fileUploadField,
          ));
          final client = ExceptionHTTPClient(authClient(http.Client()));
          final responseStream = await client.send(request);
          await http.Response.fromStream(responseStream);
        });
