//
//  NameSpaceTest.swift
//  One
//
//  Created by cyzone on 2020/8/12.
//

import SwiftUI

//matchedGeometryEffect。这是一个新的SwiftUI效果，可以在两个视图之间插入位置和大小
//发生动画时，SwiftUI会在视图中插入值更改。在前面的示例中，我们frame根据isExpanded状态更改值。在大多数情况下，这是很不错的选择，但是有时候，仅仅改变价值还是无法满足您的布局需求。假设您要将布局从更改HStack为VStack。
//matchedGeometryEffect可以在两个视图之间设置位置和大小的动画。我们需要做的是将两个视图链接在一起
struct NameSpaceTest: View {
    
//    @State private var isExpanded = false
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 10)
//            .foregroundColor(Color.pink)
//            .frame(width: isExpanded ? 100: 60, height: isExpanded ? 100: 60)
//            .onTapGesture {
//                withAnimation {
//                    isExpanded.toggle()
//                }
//            }
//
//    }
    
    @State private var isExpanded = false
    @Namespace var namespace
    
    var body: some View {
        Group() {
            if isExpanded {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.pink)
                        .frame(width: 60, height: 60)
                        .matchedGeometryEffect(id: "RoundedRectangle", in: namespace)
                    Text("Hello SwiftUI!").fontWeight(.semibold)
                        .matchedGeometryEffect(id: "text", in: namespace)
                }
            } else {
                HStack {
                    Text("Hello SwiftUI!").fontWeight(.semibold)
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.pink)
                        .frame(width: 60, height: 60)
                        .matchedGeometryEffect(id: "RoundedRectangle", in: namespace)
                }
            }
        }.onTapGesture {
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
//    @Namespace var namespace
//    @State var isDisplay = true
//
//    var body: some View {
//        ZStack {
//            if isDisplay {
//                View1(namespace: namespace, isDisplay: $isDisplay)
//            } else {
//                View2(namespace: namespace, isDisplay: $isDisplay)
//            }
//        }
//    }
}

struct View1: View {
    
    let namespace: Namespace.ID
    
    @Binding var isDisplay: Bool
    
    var body: some View {
        VStack {
            Image("Illustration5")
                .resizable()
                .frame(width: 150, height: 100)
                .matchedGeometryEffect(id: "img", in: namespace)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue)
        .onTapGesture {
            withAnimation {
                self.isDisplay.toggle()
            }
        }
    }
}

struct View2: View {
    
    let namespace: Namespace.ID
    
    @Binding var isDisplay: Bool
    
    var body: some View {
        VStack {
            Spacer()
            Image("Illustration5")
                .resizable()
                .frame(width: 300, height: 200)
                .matchedGeometryEffect(id: "img", in: namespace)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation {
                self.isDisplay.toggle()
            }
        }
    }
}



struct NameSpaceTest_Previews: PreviewProvider {
    static var previews: some View {
        NameSpaceTest()
    }
}


