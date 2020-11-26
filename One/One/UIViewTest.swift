//
//  UIViewTest.swift
//  One
//
//  Created by cyzone on 2020/7/31.
//

import SwiftUI
import UIKit


//可以将UIKit封装成SwiftUIView，这意味着我们可以通过它来搭建桥梁，可以很方便地复用以往在 UIKit 所有的组件，这很强大。

struct GCIndicatorView: UIViewRepresentable{
    
    //使用 @Binding 修饰的属性，属性会变成一个引用类型，从父视图传递给子视图，这样父子视图的状态就可以关联起来了，当属性变化时会同时改变父子视图。
    @Binding var isShowing:Bool
    var color:UIColor?
    
    
    
    typealias UIViewType = UIActivityIndicatorView
    
    //创建一个 UIView 的视图组件用于展示
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator =  UIActivityIndicatorView(style: .medium)
        indicator.color = color
        return indicator
    }
    
    //更新视图组件到最新的内容
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isShowing ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//struct UIViewTest_Previews: PreviewProvider {
//    static var previews: some View {
//       GCIndicatorView(isShowing: <#T##Binding<Bool>#>, color: <#T##UIColor?#>)
//    }
//}
//
