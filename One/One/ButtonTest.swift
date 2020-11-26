//
//  ButtonTest.swift
//  One
//
//  Created by cyzone on 2020/7/28.
//

import SwiftUI

struct ButtonTest: View {
    var body: some View {
        VStack{
            Button {
                //点击或选择按钮后要执行的代码
                print("Hello world")
            } label: {
                //描述按钮的外观
                Text("Hello world")
                    .fontWeight(.bold)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(Color.white)
                    .cornerRadius(40)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.purple,lineWidth: 5))
            }

        }
    }
}

//modifier的顺序很重要()
//1.后添加的修饰符包含上面的修饰符
//比如先调用padding,再调用background,就会先增加边距,然后再添加背景色,那么背景色是包含增加边距的部分
//2.不同修饰符返回的对象不一样,所以View特定的修饰符最好放在前面去调用


//overlay在当前的顶部覆盖另一个视图


struct ButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        
        ButtonTest()
            .previewDisplayName("xxxx")
            .previewLayout(.fixed(width: 300.0, height: 200))
            .environment(\.sizeCategory, .small)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
            .environment(\.colorScheme, .dark)
            .environment(\.layoutDirection, .leftToRight)

    }
}
