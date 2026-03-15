# Swift 循环 Demo

## 简介

本示例演示 Swift 中各种循环结构的用法，包括 for-in 循环、while 循环、repeat-while 循环，以及循环控制语句（break、continue）和标签语句。

## 基本原理

循环是编程中的基础控制结构，用于重复执行一段代码。Swift 提供了多种循环方式：

1. **for-in 循环**：最适合遍历序列（数组、字典、范围等）
2. **while 循环**：在条件为真时重复执行
3. **repeat-while**：先执行后判断，保证至少执行一次

Swift 的循环语法简洁明了，采用了接近自然语言的风格，让代码更易读。

## 启动和使用

### 环境要求

- macOS 系统（自带 Swift）
- 或从 https://swift.org/download/ 安装 Swift

### 安装和运行

```bash
cd swift-loops-demo
swift run
```

### 预期输出

```
for-in 循环:
  1
  2
  3
  4
  5

区间示例:
  0..<5: 0
  0..<5: 1
  0..<5: 2
  0..<5: 3
  0..<5: 4

跳过元素:
  0 2 4 6 8

while 循环:
  count = 0
  count = 1
  count = 2

repeat-while 循环:
  num = 0
  num = 1
  num = 2

循环控制:
  1 2 4 5 6

标签示例:
  i=1, j=1
```

## 教程

### for-in 循环

for-in 是 Swift 中最常用的循环结构，用于遍历序列：

```swift
// 遍历闭区间 1...5（包含 1 和 5）
for i in 1...5 {
    print(i)
}
```

**区间操作符**：
- `1...5`：闭区间，包含 1 和 5
- `1..<5`：半开区间，包含 1，不包含 5

```swift
// 0..<5 遍历 0, 1, 2, 3, 4
for i in 0..<5 {
    print(i)
}
```

### stride 函数

当需要自定义步长时，使用 `stride` 函数：

```swift
// 从 0 到 10，步长为 2：0, 2, 4, 6, 8
for i in stride(from: 0, to: 10, by: 2) {
    print(i)
}

// 如果想包含末尾，使用 through
for i in stride(from: 0, through: 10, by: 2) {
    print(i)  // 0, 2, 4, 6, 8, 10
}
```

**注意**：`stride(from:to:by:)` 不包含末尾，而 `stride(from:through:by:)` 包含末尾。

### while 循环

while 循环在条件为真时重复执行：

```swift
var count = 0
while count < 3 {
    print("count = \(count)")
    count += 1
}
```

**重要**：确保循环条件最终会变为 false，否则会产生无限循环。

### repeat-while 循环

repeat-while（也称为 do-while）先执行循环体，再判断条件：

```swift
var num = 0
repeat {
    print("num = \(num)")
    num += 1
} while num < 3
```

这保证循环体至少执行一次，即使条件一开始就是 false。

### 循环控制语句

Swift 提供了两个重要的循环控制语句：

**continue**：跳过当前循环的剩余代码，继续下一次循环

```swift
for i in 1...5 {
    if i == 3 {
        continue  // 跳过 i=3 的情况
    }
    print(i)
}
// 输出: 1, 2, 4, 5（跳过了 3）
```

**break**：立即退出整个循环

```swift
for i in 1...10 {
    if i == 7 {
        break  // 当 i=7 时退出循环
    }
    print(i)
}
// 输出: 1, 2, 3, 4, 5, 6
```

### 标签语句

Swift 的标签用于控制多层嵌套循环：

```swift
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if j == 2 {
            break outerLoop  // 跳出外层循环
        }
        print("i=\(i), j=\(j)")
    }
}
```

没有标签的情况下，`break` 只会跳出内层循环。使用标签可以控制退出任意一层循环。

### 常见问题和注意事项

1. **区间类型**：区分 `...` 和 `..<`，前者包含末尾，后者不包含
2. **步长为 0**：`stride` 的步长不能为 0，会导致无限循环
3. **死循环**：确保循环条件最终会变为 false
4. **性能**：Swift 对区间迭代做了优化，通常不需要担心性能
5. **标签语法**：标签后必须跟循环语句，不能单独使用

## 关键代码详解

### main.swift 完整代码

```swift
// swift-loops-demo.swift

// ============ for-in 循环 ============
print("for-in 循环:")
for i in 1...5 {
    print("  \(i)")
}

// 区间
print("\n区间示例:")
for i in 0..<5 {
    print("  0..<5: \(i)")
}

// 跳过元素
print("\n跳过元素:")
for i in stride(from: 0, to: 10, by: 2) {
    print("  \(i)", terminator: " ")
}
print()

// ============ while 循环 ============
print("\nwhile 循环:")
var count = 0
while count < 3 {
    print("  count = \(count)")
    count += 1
}

// ============ repeat-while ============
print("\nrepeat-while 循环:")
var num = 0
repeat {
    print("  num = \(num)")
    num += 1
} while num < 3

// ============ 循环控制语句 ============
print("\n循环控制:")
for i in 1...10 {
    if i == 3 {
        continue  // 跳过本次循环
    }
    if i == 7 {
        break     // 退出循环
    }
    print("  \(i)", terminator: " ")
}
print()

// ============ 标签 ============
print("\n标签示例:")
outerLoop: for i in 1...3 {
    for j in 1...3 {
        if j == 2 {
            break outerLoop
        }
        print("  i=\(i), j=\(j)")
    }
}
```

### 核心代码解析

1. **for-in 循环**：`for i in 1...5`
   - `1...5` 是闭区间操作符，表示 1 到 5（包含两端）
   - 循环变量 `i` 会自动获取序列中的每个值

2. **半开区间**：`0..<5`
   - 包含 0，不包含 5
   - 等价于数学中的 `[0, 5)` 区间
   - 常用于数组索引遍历

3. **stride(from:to:by:)**：自定义步长
   - `from` 起始值，`to` 结束值（不包含），`by` 步长
   - 适合需要跳过某些值的场景

4. **terminator 参数**：`print("  \(i)", terminator: " ")`
   - 默认 print 会换行
   - 使用 `terminator: " "` 改为用空格分隔

5. **continue**：跳过本次循环
   - 在本例中，当 i==3 时跳过
   - 循环继续执行 i=4, 5...

6. **break**：退出循环
   - 在本例中，当 i==7 时退出
   - 8, 9, 10 都不会执行

7. **标签语法**：`outerLoop: for i in 1...3`
   - 标签名后加冒号
   - `break outerLoop` 可以退出标签指定的循环
