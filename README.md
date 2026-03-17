# README

1. 生成类

    ```shell
    cd src/main/java
    javac src/main/java/com/craftinginterpreters/tool/GenerateAst.java
    java -cp . com.craftinginterpreters.tool.GenerateAst com/craftinginterpreters/lox
    ```

2. 代码说明

    Parser.java
    负责语法分析（Parsing），将 Token 列表转换成抽象语法树（AST）。

    实现了递归下降解析器，按照语法优先级从低到高调用： expression → assignment → equality → comparison → term → factor → unary → primary
    输出：List\<Stmt\>（语句节点树）和嵌套的 Expr（表达式节点树）
    关键方法：
    parse() — 入口，解析整个程序
    declaration() — 处理变量声明/语句，含错误恢复
    synchronize() — panic mode 错误恢复，跳到下一个语句边界

    Interpreter.java
    负责解释执行（Interpreting），遍历 AST 并求值/执行。

    实现了 Expr.Visitor\<Object\> 和 Stmt.Visitor\<Void\> 两个访问者接口
    维护运行时环境（变量作用域链）：Environment environment
    关键方法：
    interpret() — 入口，执行语句列表
    evaluate() — 对表达式求值，返回 Object
    execute() — 执行一条语句
    executeBlock() — 执行块语句，管理作用域的进入/退出

    两者在流水线中的位置

    源代码 → Scanner → Token列表 → Parser → AST → Interpreter → 执行结果
    Parser 的输出（AST）直接是 Interpreter 的输入。
