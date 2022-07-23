// class MockAuthClient extends Mock implements AuthHTTPClient {}
//
// class MockCodeMapper extends Mock implements TransactionCodeMapper {}
//
void main() {
  // late MockAuthClient mockClient;
  // late MockCodeMapper mockMapper;
  // late TransactionCodeGetter sut;
  // setUp(() {
  //   mockClient = MockAuthClient();
  //   mockMapper = MockCodeMapper();
  //   sut = newTransactionCodeGetter(mockClient, mockMapper);
  // });
  //
  // final tTransactionType = randomBool() ? TransactionType.deposit : TransactionType.withdrawal;
  // final wantUri =
  //     Uri.https(apiHost, genTransactionCodeEndpoint, {transactionTypeKey: transactionTypeValue(tTransactionType)});
  //
  // final tJson = randomJson();
  // final tCode = randomTransactionCode();
  //
  // test("should get json from http and then decode it using mapper", () async {
  //   // arrange
  //   when(() => mockClient.get(wantUri)).thenAnswer((_) async => http.Response(json.encode(tJson), 200));
  //   when(() => mockMapper.fromJson(tJson)).thenReturn(tCode);
  //   // act
  //   final result = await sut(tTransactionType);
  //   // assert
  //   expect(result, Right(tCode));
  // });
}
