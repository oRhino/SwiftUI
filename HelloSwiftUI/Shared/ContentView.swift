//
//  ContentView.swift
//  Shared
//
//  Created by cyzone on 2020/8/6.
//

import SwiftUI

struct ContentView: View {
    
    @State private var colorChange = false
    @State private var sizeChange = false
    
    
    var body: some View {
        
        Image(systemName: "heart.fill")
            .padding(.leading)
            .font(.system(size: 200))
            .foregroundColor(colorChange ? .blue : .green)
            .scaleEffect(sizeChange ? 1.5 : 1)
            .animation(.spring())
            .onTapGesture{
                self.colorChange.toggle()
            }
            .onLongPressGesture {
                self.sizeChange.toggle()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        //environment(\.sizeCategory, .small)
        //.preferredColorScheme(.dark)
        
    
        ForEach(["iPhone 8","iPhone 11","iPhone 11 Pro Max"], id: \.self) { deviceName in
            ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
