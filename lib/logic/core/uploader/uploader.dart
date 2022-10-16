import 'dart:io';

import 'package:avencia/logic/core/uploader/simple_file.dart';
import 'package:helpers/logic/auth/auth_http_client.dart';
import 'package:helpers/logic/core.dart';
import 'package:helpers/logic/errors/errors.dart';
import 'package:http/http.dart' as http;

const fileUploadField = "file";

// TODO: add progress indication
typedef Uploader = Future<UseCaseRes<void>> Function(String endpoint, SimpleFile file);

Uploader newUploader(AuthHTTPClient client, String apiHost) =>
    (endpoint, file) => withExceptionHandling(() async {
          final request = http.MultipartRequest("PUT", Uri.https(apiHost, endpoint));
          final fileBytes = File(file.path).readAsBytesSync();
          request.files.add(http.MultipartFile.fromBytes(
            fileUploadField,
            fileBytes,
            filename: fileUploadField,
          ));
          // TODO: currently the request is sent through the AuthHTTPClient, which sets the contentType to be JSON, but Uploader does not send JSON. This might cause bugs in the future.
          final responseStream = await client.send(request);
          await http.Response.fromStream(responseStream);
        });
