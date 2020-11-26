//
//  ViewReload.swift
//  One
//
//  Created by cyzone on 2020/8/7.
//

import SwiftUI

struct ViewReload: View {
    
    @State private var n: Int = 0

    var body: some View {
        VStack {
            Spacer()

//            OddOrEvenView(number: n)
            EquatableView(content: OddOrEvenView(number: n))
//            OddOrEvenView(number: n).equatable()
            
            Text("\(n)")
                .foregroundColor(.primary)
                .padding(.vertical, 20)

            Button("随机生成整数") {
                self.n = Int.random(in: 10...1000)
            }
            .padding(.vertical, 20)

            Spacer()
        }
    }
}

struct ViewReload_Previews: PreviewProvider {
    static var previews: some View {
        ViewReload()
    }
}

extension Int {
    var isOdd: Bool { self % 2 != 0 }
    var isEven: Bool { self % 2 == 0 }
}

struct OddOrEvenView: View {
    
    let number: Int
//在当前版本中的SwiftUI中，如果某个View实现了Equatable协议，只有当其内部存在复杂属性的情况下，系统才会调用Equatable协议中的函数。
//    类似于用@State,ObservedObject或者environmentObject等等，与之相对应的是POD(plain data),也就是基本数据类型。
    
//    @State private var show = false

    var body: some View {
        print("OddOrEvenView刷新了， -- \(self.number)")
        return VStack {
            Text("\(number.isOdd ? "奇数" : "偶数")")
                .font(.largeTitle)
                .padding(20)
                .foregroundColor(.white)
                .background(RoundedRectangle(cornerRadius: 5).fill(number.isOdd ? Color.green : Color.blue))
        }
    }
    
}

extension OddOrEvenView:Equatable{
    static func ==(lhs: OddOrEvenView, rhs: OddOrEvenView) -> Bool {
            return lhs.number.isOdd == rhs.number.isOdd
    }
}

//当view中包含复杂属性的时候，如果view实现了Equatable协议，则调用我们写的协议函数
//当view中不包含复杂属性的时候，如果实现了Equatable协议，则系统会自动根据view值的变化进行刷新，如果没有实现Equatable协议，则每次都需要计算body


