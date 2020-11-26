//
//  Gesture.swift
//  One
//
//  Created by cyzone on 2020/7/28.
//

import SwiftUI

struct Gesture: View {
    
    
    @State private var name = ""

    
    var body: some View {
        
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 200))
//            .foregroundColor(.green)
//            .opacity(longPressTap ? 0.4 : 1)
//            .scaleEffect(isPressed ? 0.5 : 1)
//            .animation(.easeInOut)
//            .onTapGesture(perform: {
//                self.isPressed.toggle()
//            })
//            .onLongPressGesture(minimumDuration: 1){
//                self.isPressed.toggle()
//            }
        
//        VStack{
//            TextEditor(text: $profileText)
//                .foregroundColor(.black)
//
//        }
//        .padding()
        
        NavigationView{
            
            VStack{
                TextField("123", text: $name) { changed in
                    print("onEditing: \(changed)")
                } onCommit: {
                    print("userName: \(self.name)")
                }
                .padding(10)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                NavigationLink(destination: ViewControllerRepresentable()) {
                    Text("Go")
                }
                
            }
            
        }
        
        
    }
}

struct Gesture_Previews: PreviewProvider {
    static var previews: some View {
        Gesture()
    }
}
