//
//  LazyCard.swift
//  One
//
//  Created by cyzone on 2020/7/29.
//

import SwiftUI

//
//struct LazyCard: View {
//    
//    let gridItems = [GridItem(.fixed(100.0),spacing: 10.0,alignment: .top),
//                     GridItem(.fixed(250.0),spacing: 30.0,alignment: .center),
//                     GridItem(.fixed(150.0),spacing: 10.0,alignment: .bottomTrailing)]
//    
//    var body: some View {
//        
//        ScrollView(.vertical) {
//            
//            LazyVGrid(columns: gridItems, alignment: .center, spacing: 19) {
//                ForEach(0..<100){idx in
//                    VStack{
//                        if idx == 3 {
//                            Rectangle().fill(Color.pink)
//                        }else if idx == 4 {
//                            Rectangle().fill(Color.green)
//                                .frame(height: 50)
//                        }else if idx == 5 {
//                            Rectangle().fill(Color.blue)
//                                .frame(width: 100,height: 50)
//                        }else {
//                            Rectangle().fill(Color.yellow)
//                                .frame(height: 30)
//                        }
//                    }.overlay(Text("\(idx)"))
//                    
//                }
//            }
//            .border(Color.gray)
//            .frame(width: 700)
//            .padding(20)
//            .modifier(ViewModifier)
//        }
//        .frame(height: 200)
//        .border(Color.black)
//    }
//}
//
//struct LazyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        LazyCard()
//    }
//}

//LazyVCard,LazyHCard
//LazyVStack LazyHStack
//包含的视图仅在屏幕范围内渲染,离开屏幕时,不是视图层级的一部分


//LazyVCard垂直排放单元格在列中,当行已满,继续向下到下一列
/*
 1 2 3 4 5
 6 7 8 9 10
 11 ....
 */

//LazyHCard将单元格水平放在列中,列已满继续下一列
/*
 1 4 7 10 13
 2 5 8 11 ..
 3 6 9 12
 */

//可滚动,必须包装在ScrollView
/*
ScrollView(.vertical) { // .vertical is the default, so it can be omitted
    LazyVGrid(columns: columns) {
        ...
    }
}

ScrollView(.horizontal) {
    LazyHGrid(rows: rows) {
        ...
    }
}
 //行列数据
 //对齐方式 在LazyVGrid的宽度比内容宽度更宽时使用 左 中 右
 //间距 行之间的间距
 //固定视图 指示哪些视图谷底你那个在滚动范围中(比如分区头,尾)
 //视图构建器
 LazyVGrid.init(columns: [GridItem], alignment: HorizontalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)
 
 
 //行列数据
 //对齐方式 在LazyHGrid的高度比内容高度更大时使用 上 中 下
 //间距 行之间的间距
 LazyHGrid.init(rows: [GridItem], alignment: VerticalAlignment = .center, spacing: CGFloat? = nil, pinnedViews: PinnedScrollableViews = .init(), @ViewBuilder content: () -> Content)
*/

/*
let gw = [grid's width]
let af = [sum of all fixed columns widths]
let sp = [spacing]
let nc = [number of non-fixed columns]

let unclamped_width = (gw - (af + sp)) / nc

let column_width = min(max(unclamped_width, minimum), maximum)
*/



struct LazyCard_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
