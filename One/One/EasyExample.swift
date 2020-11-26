//
//  EasyExample.swift
//  One
//
//  Created by cyzone on 2020/7/31.
//

/*
 PreferenceKey协议
及其相关的调节剂：.preference（） ，.transformPreference（） ，.anchorPreference（） ，.transformAnchorPreference（） ，.onPreferenceChange（） ，.backgroundPreferenceValue（）和.overlayPreferenceValue（）
 */
//使我们能够“附加”某些属性到视图的机制。这些属性称为Preferences，这些属性可以轻松地沿视图层次结构传递。甚至有可能安装在这些首选项更改时执行的回调。

//举例 : .navigationBarTitle（）

//使我们可以在任何特定视图上添加我们自己选择的一些数据。以后可以通过祖先视图查询此数据。可以通过多种方式读取首选项

import SwiftUI

struct MyTextPreferenceData: Equatable {
    let viewIdx: Int
    let rect: CGRect
}


struct MyTextPreferenceKey: PreferenceKey {
    //类型别名，指示我们希望通过首选项公开什么类型的信息
    typealias Value = [MyTextPreferenceData]

    //当尚未显式设置首选项键值时，SwiftUI将使用此defaultValue
    static var defaultValue: [MyTextPreferenceData] = []
    
    //这是一个静态函数，SwiftUI将使用它来合并在视图树中找到的所有键值。通常，您可以使用它来累加接收到的所有值，但是您可以做任何您想做的事情。在我们的例子中，当SwiftUI遍历树时，它将收集首选项键值并将它们存储在单个数组中，我们稍后可以访问该数组。您应该知道，值是按视图树顺序提供给reduce函数的。
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct EasyExample : View {
    
    @State private var activeIdx: Int = 0
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 12)
    
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 3.0).foregroundColor(Color.green)
                .frame(width: rects[activeIdx].size.width, height: rects[activeIdx].size.height)
                .offset(x: rects[activeIdx].minX, y: rects[activeIdx].minY)
                .animation(.easeInOut(duration: 1.0))
            
            VStack {
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                    MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                    MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                    MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                    MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                    MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                    MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                    MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                    MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                    MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
                }
                
                Spacer()
                }.onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                    //当首选项更改时，我们会适当地更新rects数组
                    for p in preferences {
                        self.rects[p.viewIdx] = p.rect
                    }
            }
        }.coordinateSpace(name: "myZstack") //命名其坐标空间
    }
}

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let idx: Int
    
    var body: some View {
        Text(label)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: idx)).onTapGesture { self.activeMonth = self.idx }
    }
}

//GeometryReader来获取文本大小和位置
struct MyPreferenceViewSetter: View {
    let idx: Int
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(Color.clear)
                .preference(key: MyTextPreferenceKey.self,
                            value: [MyTextPreferenceData(viewIdx: self.idx, rect: geometry.frame(in: .named("myZstack")))])
        }
    }
}
/*
struct EasyExample: View {
    @State private var activeIdx: Int = 0
        
        var body: some View {
            VStack {
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "January", idx: 0)
                    MonthView(activeMonth: $activeIdx, label: "February", idx: 1)
                    MonthView(activeMonth: $activeIdx, label: "March", idx: 2)
                    MonthView(activeMonth: $activeIdx, label: "April", idx: 3)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "May", idx: 4)
                    MonthView(activeMonth: $activeIdx, label: "June", idx: 5)
                    MonthView(activeMonth: $activeIdx, label: "July", idx: 6)
                    MonthView(activeMonth: $activeIdx, label: "August", idx: 7)
                }
                
                Spacer()
                
                HStack {
                    MonthView(activeMonth: $activeIdx, label: "September", idx: 8)
                    MonthView(activeMonth: $activeIdx, label: "October", idx: 9)
                    MonthView(activeMonth: $activeIdx, label: "November", idx: 10)
                    MonthView(activeMonth: $activeIdx, label: "December", idx: 11)
                }
                
                Spacer()
            }
        }
    
}

struct EasyExample_Previews: PreviewProvider {
    static var previews: some View {
        EasyExample()
    }
}

struct MonthView: View {
    @Binding var activeMonth: Int
    let label: String
    let idx: Int

    var body: some View {
        Text(label)
            .padding(10)
            .onTapGesture { self.activeMonth = self.idx }
            .background(MonthBorder(show: activeMonth == idx))
    }
}

struct MonthBorder: View {
    let show: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0).foregroundColor(show ? Color.red : Color.clear)
            .animation(.easeInOut(duration: 0.6))
    }
}

 */
