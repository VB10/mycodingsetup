enum RegExputils {
  url(r'(https?|ftp)://[^\s/$.?#].[^\s]*');

  final String _regexBody;
  const RegExputils(String regexBody) : _regexBody = regexBody;

  RegExp get regex => RegExp(_regexBody, caseSensitive: false);
}
