// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:angular_ast/src/token/tokens.dart';
import 'package:test/test.dart';

void main() {
  NgSimpleToken token;

  test('bang', () {
    token = new NgSimpleToken.bang(0);
    expect(token.lexeme, '!');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.bang);
  });

  test('closeBracket', () {
    token = new NgSimpleToken.closeBracket(0);
    expect(token.lexeme, ']');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.closeBracket);
  });

  test('closeParen', () {
    token = new NgSimpleToken.closeParen(0);
    expect(token.lexeme, ')');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.closeParen);
  });

  test('commentBegin', () {
    token = new NgSimpleToken.commentBegin(0);
    expect(token.lexeme, '<!--');
    expect(token.end, 4);
    expect(token.length, 4);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.commentBegin);
  });

  test('commentEnd', () {
    token = new NgSimpleToken.commentEnd(0);
    expect(token.lexeme, '-->');
    expect(token.end, 3);
    expect(token.length, 3);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.commentEnd);
  });

  test('dash', () {
    token = new NgSimpleToken.dash(0);
    expect(token.lexeme, '-');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.dash);
  });

  test('dashedIdenifier', () {
    token = new NgSimpleToken.identifier(0, 'some_dashed-identifier');
    expect(token.lexeme, 'some_dashed-identifier');
    expect(token.end, 22);
    expect(token.length, 22);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.identifier);
  });

  test('tagStart', () {
    token = new NgSimpleToken.openTagStart(0);
    expect(token.lexeme, '<');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.openTagStart);
  });

  test('tagEnd', () {
    token = new NgSimpleToken.tagEnd(0);
    expect(token.lexeme, '>');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.tagEnd);
  });

  test('equalSign', () {
    token = new NgSimpleToken.equalSign(0);
    expect(token.lexeme, '=');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.equalSign);
  });

  test('forwardSlash', () {
    token = new NgSimpleToken.forwardSlash(0);
    expect(token.lexeme, '/');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.forwardSlash);
  });

  test('hash', () {
    token = new NgSimpleToken.hash(0);
    expect(token.lexeme, '#');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.hash);
  });

  test('identifier', () {
    token = new NgSimpleToken.identifier(0, 'some_tag_identifier');
    expect(token.lexeme, 'some_tag_identifier');
    expect(token.end, 19);
    expect(token.length, 19);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.identifier);
  });

  test('mustacheBegin', () {
    token = new NgSimpleToken.mustacheBegin(0);
    expect(token.lexeme, '{{');
    expect(token.end, 2);
    expect(token.length, 2);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.mustacheBegin);
  });

  test('mustacheEnd', () {
    token = new NgSimpleToken.mustacheEnd(0);
    expect(token.lexeme, '}}');
    expect(token.end, 2);
    expect(token.length, 2);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.mustacheEnd);
  });

  test('openBracket', () {
    token = new NgSimpleToken.openBracket(0);
    expect(token.lexeme, '[');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.openBracket);
  });

  test('openParen', () {
    token = new NgSimpleToken.openParen(0);
    expect(token.lexeme, '(');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.openParen);
  });

  test('period', () {
    token = new NgSimpleToken.period(0);
    expect(token.lexeme, '.');
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.period);
  });

  test('star', () {
    token = new NgSimpleToken.star(0);
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.star);
  });

  test('atSign', () {
    token = new NgSimpleToken.atSign(0);
    expect(token.end, 1);
    expect(token.length, 1);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.atSign);
  });

  test('text', () {
    token = new NgSimpleToken.text(0, 'some long text string');
    expect(token.lexeme, 'some long text string');
    expect(token.end, 21);
    expect(token.length, 21);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.text);
  });

  test('unexpectedChar', () {
    token = new NgSimpleToken.unexpectedChar(0, '!@#\$');
    expect(token.lexeme, '!@#\$');
    expect(token.end, 4);
    expect(token.length, 4);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.unexpectedChar);
  });

  test('whitespace', () {
    token = new NgSimpleToken.whitespace(0, '     \t\t\n');
    expect(token.lexeme, '     \t\t\n');
    expect(token.end, 8);
    expect(token.length, 8);
    expect(token.offset, 0);
    expect(token.type, NgSimpleTokenType.whitespace);
  });

  test('doubleQuotedText - closed', () {
    var quoteToken = new NgSimpleQuoteToken.doubleQuotedText(
        0, '"this is a \"quoted\" text"', true);
    expect(quoteToken.lexeme, '"this is a \"quoted\" text"');
    expect(quoteToken.contentLexeme, 'this is a \"quoted\" text');
    expect(quoteToken.contentEnd, 24);
    expect(quoteToken.contentLength, 23);
    expect(quoteToken.contentOffset, 1);
    expect(quoteToken.quoteEndOffset, 24);
    expect(quoteToken.end, 25);
    expect(quoteToken.offset, 0);
    expect(quoteToken.lexeme, '"this is a \"quoted\" text"');
    expect(quoteToken.length, 25);
    expect(quoteToken.type, NgSimpleTokenType.doubleQuote);
  });

  test('doubleQuotedText - open', () {
    var quoteToken = new NgSimpleQuoteToken.doubleQuotedText(
        0, '"this is a \"quoted\" text', false);
    expect(quoteToken.contentLexeme, 'this is a \"quoted\" text');
    expect(quoteToken.contentEnd, 24);
    expect(quoteToken.contentLength, 23);
    expect(quoteToken.contentOffset, 1);
    expect(quoteToken.quoteEndOffset, null);
    expect(quoteToken.offset, 0);
    expect(quoteToken.lexeme, '"this is a \"quoted\" text');
    expect(quoteToken.length, 24);
    expect(quoteToken.type, NgSimpleTokenType.doubleQuote);
  });

  test('singleQuotedText - closed', () {
    var quoteToken = new NgSimpleQuoteToken.singleQuotedText(
        0, "'this is a \'quoted\' text'", true);
    expect(quoteToken.contentLexeme, "this is a \'quoted\' text");
    expect(quoteToken.contentEnd, 24);
    expect(quoteToken.contentLength, 23);
    expect(quoteToken.contentOffset, 1);
    expect(quoteToken.quoteEndOffset, 24);
    expect(quoteToken.end, 25);
    expect(quoteToken.offset, 0);
    expect(quoteToken.lexeme, "'this is a \'quoted\' text'");
    expect(quoteToken.length, 25);
    expect(quoteToken.type, NgSimpleTokenType.singleQuote);
  });

  test('doubleQuotedText - open', () {
    var quoteToken = new NgSimpleQuoteToken.singleQuotedText(
        0, "'this is a \'quoted\' text", false);
    expect(quoteToken.contentLexeme, "this is a \'quoted\' text");
    expect(quoteToken.end, 24);
    expect(quoteToken.contentLength, 23);
    expect(quoteToken.contentOffset, 1);
    expect(quoteToken.quoteEndOffset, null);
    expect(quoteToken.offset, 0);
    expect(quoteToken.lexeme, "'this is a \'quoted\' text");
    expect(quoteToken.length, 24);
    expect(quoteToken.type, NgSimpleTokenType.singleQuote);
  });
}
