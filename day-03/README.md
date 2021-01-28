## notes

### Tips
+ 查看`Xcode`对应的`Swift`版本：`xcrun swift --version`

### Operator
+ Swift 没有 `**` 运算符
### Conditions
+ 条件判断不使用`()`包裹条件语句
### Switch statements
+ 关键字`switch`和`case`位于同一列，`case`不缩进
+ 如果匹配，只会执行`case`代码块中的代码，如果需要进入下一个`case`需要使用`fallthrough`
+ 对于一个值的判断，使用`switch`只会对值读取一次，使用`if`可能会读取多次
+ 必须包含`default`语句
