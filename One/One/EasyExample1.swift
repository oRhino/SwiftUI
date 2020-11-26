//
//  EasyExample1.swift
//  One
//
//  Created by cyzone on 2020/7/31.
//


//协议比继承更灵活的定义共享功能
//Shape -> Rectangle,Circle
//类层次结构允许你继承存储的属性,并且可以在重写时super调用,面向协议不可能
//类层次结构只能使用单个继承,如果需要共享功能,可能会遇到从多个类继承的问题,协议不会有这样的问题
//使用协议还可以添加一致性,而使用类层次结构时,除非使用超类,否则无法替换超类


//面向对象 关注对象是什么
//面向协议 更关注对象能做什么,其行为和能力

//类型可以遵循多个协议
//类型可以从多个协议获取默认行为
//协议扩展不会引入任何其它状态
//协议可以被clas,struct,enum采用,而继承仅限于class
//协议允许将扩展添加到现有类型后进行追溯建模


import SwiftUI

//.backgroundPreferenceValue()具有其对应.overlayPreferenceValue()。它执行相同的操作，但不是在后面绘制，而是在修改后的视图前面进行绘制。

struct MyTextPreferenceAnchData {
    let viewIdx:Int
//    let bounds: Anchor<CGRect>
    var topLeading: Anchor<CGPoint>? = nil
    var bottomTrailing: Anchor<CGPoint>? = nil
    
    
}

struct MyTextPreferenceAnchKey: PreferenceKey {
    
    typealias Value = [MyTextPreferenceAnchData]
    
    static var defaultValue: [MyTextPreferenceAnchData] = []
    
    static func reduce(value: inout [MyTextPreferenceAnchData], nextValue: () -> [MyTextPreferenceAnchData]) {
        value.append(contentsOf: nextValue())
    }
}

struct EasyExample1: View {
    
    @State private var activeIdx: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                MonthView1(activeMonth: $activeIdx, label: "January", idx: 0)
                MonthView1(activeMonth: $activeIdx, label: "February", idx: 1)
                MonthView1(activeMonth: $activeIdx, label: "March", idx: 2)
                MonthView1(activeMonth: $activeIdx, label: "April", idx: 3)
            }
            
            Spacer()
            
            HStack {
                MonthView1(activeMonth: $activeIdx, label: "May", idx: 4)
                MonthView1(activeMonth: $activeIdx, label: "June", idx: 5)
                MonthView1(activeMonth: $activeIdx, label: "July", idx: 6)
                MonthView1(activeMonth: $activeIdx, label: "August", idx: 7)
            }
            
            Spacer()
            
            HStack {
                MonthView1(activeMonth: $activeIdx, label: "September", idx: 8)
                MonthView1(activeMonth: $activeIdx, label: "October", idx: 9)
                MonthView1(activeMonth: $activeIdx, label: "November", idx: 10)
                MonthView1(activeMonth: $activeIdx, label: "December", idx: 11)
            }
            
            Spacer()
            //可以访问整个视图树的首选项数组。这样，我们可以获取所有月份视图的所有边界，并且可以使用它们来计算需要绘制边界的位置。
        }.backgroundPreferenceValue(MyTextPreferenceAnchKey.self) { preferences in
            GeometryReader { geometry in
                self.createBorder(geometry, preferences)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }
    
//    func createBorder(_ geometry: GeometryProxy, _ preferences: [MyTextPreferenceAnchData]) -> some View {
//        
//        let p = preferences.first(where: { $0.viewIdx == self.activeIdx })
//        
//        let bounds = p != nil ? geometry[p!.bounds] : .zero
//                
//        return RoundedRectangle(cornerRadius: 15)
//                .stroke(lineWidth: 3.0)
//                .foregroundColor(Color.green)
//                .frame(width: bounds.size.width, height: bounds.size.height)
//                .fixedSize()
//                .offset(x: bounds.minX, y: bounds.minY)
//                .animation(.easeInOut(duration: 1.0))
//    }
    
    func createBorder(_ geometry: GeometryProxy, _ preferences: [MyTextPreferenceAnchData]) -> some View {
            let p = preferences.first(where: { $0.viewIdx == self.activeIdx })
            
            let aTopLeading = p?.topLeading
            let aBottomTrailing = p?.bottomTrailing
            
            let topLeading = aTopLeading != nil ? geometry[aTopLeading!] : .zero
            let bottomTrailing = aBottomTrailing != nil ? geometry[aBottomTrailing!] : .zero
            
            
            return RoundedRectangle(cornerRadius: 15)
                .stroke(lineWidth: 3.0)
                .foregroundColor(Color.green)
                .frame(width: bottomTrailing.x - topLeading.x, height: bottomTrailing.y - topLeading.y)
                .fixedSize()
                .offset(x: topLeading.x, y: topLeading.y)
                .animation(.easeInOut(duration: 1.0))
        }
}


struct MonthView1:View {
    @Binding var activeMonth: Int
    let label:String
    let idx:Int
    
    var body: some View{
        Text(label)
            .padding(10)
//            .anchorPreference(key: MyTextPreferenceAnchKey.self, value: .bounds, transform: {
//                [MyTextPreferenceAnchData(viewIdx: idx, bounds: $0)]
//            })
            .anchorPreference(key: MyTextPreferenceAnchKey.self, value: .topLeading, transform: { [MyTextPreferenceAnchData(viewIdx: self.idx, topLeading: $0)] })
                        .transformAnchorPreference(key: MyTextPreferenceAnchKey.self, value: .bottomTrailing, transform: { ( value: inout [MyTextPreferenceAnchData], anchor: Anchor<CGPoint>) in
                            value[0].bottomTrailing = anchor
                        })
            .onTapGesture{ self.activeMonth = idx }
    }
}


struct EasyExample1_Previews: PreviewProvider {
    static var previews: some View {
        EasyExample1()
    }
}

//不只是改变了开发iOS应用程序的方式
//最大的转变是推进了苹果开发者生态系统(iPadOS,macOS,tvOS,watchOS)






//class与struct
//类可以继承
//类有deinit,在销毁之前调用函数
//class是引用类型,struct是值类型
