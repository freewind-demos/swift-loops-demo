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
