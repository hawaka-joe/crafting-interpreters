package com.craftinginterpreters.lox;

class Token {
  final TokenType type;
  // 源代码中的原始文本（词素）
  final String lexeme;
  // 解析后的值（语义值）
  final Object literal;
  final int line; 

  Token(TokenType type, String lexeme, Object literal, int line) {
    this.type = type;
    this.lexeme = lexeme;
    this.literal = literal;
    this.line = line;
  }

  public String toString() {
    return type + " " + lexeme + " " + literal;
  }
} 