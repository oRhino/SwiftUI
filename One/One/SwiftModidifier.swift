//
//  SwiftModidifier.swift
//  One
//
//  Created by cyzone on 2020/8/13.
//

import SwiftUI

//Protocol 'View' requirement '_makeView(view:inputs:)' cannot be satisfied by a non-final class ('SwiftModidifier') because it uses 'Self' in a non-parameter, non-result type position
struct SwiftModidifier: View {
    
    @State private var count = 0
    
    var body: some View {
        
        VStack{
            
            Button(action: { self.count += 1}, label: {
                Text("Tap me!")
            })
            .padding()
            
            Text(count == 0 ? "请点击按钮!" : "\(count)")
        }
        
    }
}

struct SwiftModidifier_Previews: PreviewProvider {
    static var previews: some View {
        SwiftModidifier()
    }
}
