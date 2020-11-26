//
//  ViewControllerRe.swift
//  One
//
//  Created by cyzone on 2020/7/30.
//

import SwiftUI


struct ViewControllerRepresentable:UIViewControllerRepresentable {
    ///创建UIKit----
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
struct ViewControllerPreviews:PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable()
    }
}

