#!/bin/bash

# 作用：编译 GenerateAst 并生成 AST

# 进入源码目录
cd src/main/java || { echo "目录 src/main/java 不存在"; exit 1; }

# 编译 GenerateAst.java
javac com/craftinginterpreters/tool/GenerateAst.java
if [ $? -ne 0 ]; then
  echo "编译失败"
  exit 1
fi

# 运行 GenerateAst
java -cp . com.craftinginterpreters.tool.GenerateAst com/craftinginterpreters/lox
if [ $? -ne 0 ]; then
  echo "执行 GenerateAst 失败"
  exit 1
fi