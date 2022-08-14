List<String> capitalizeTail(List<String> values) =>
    [toLowerCase(head(values)), ...capitalizeWords(tail(values))];

List<String> capitalizeWords(List<String> words) =>
    words.map(capitalizeWord).toList();

List<String> lowerCaseWords(List<String> values) =>
    values.map(toLowerCase).toList();

String head(List<String> values) => values.first;

List<String> tail(List<String> values) => values.sublist(1).toList();

String toLowerCase(String value) => value.toLowerCase();

String toUpperCase(String value) => value.toUpperCase();

String capitalizeWord(String value) =>
    toUpperCase(value[0]) + value.substring(1);

String joinWithoutSpace(List<String> values) => values.join();
String joinWithHyphen(List<String> values) => values.join('-');
String joinWithUnderScore(List<String> values) => values.join('_');

List<String> splitWithUnderscore(String value) => value.split('_');
List<String> splitWithHyphen(String value) => value.split('-');

Function composeN(List<Function> fns) {
  final _reversed = fns.reversed.toList();

  return (x) {
    for (Function fn in _reversed) {
      x = fn(x);
    }
    return x;
  };
}

Function snakeToPascal =
    composeN([joinWithoutSpace, capitalizeWords, splitWithUnderscore]);

Function snakeToCamel =
    composeN([joinWithoutSpace, capitalizeTail, splitWithUnderscore]);

Function snakeToKebab = composeN([joinWithHyphen, splitWithUnderscore]);
