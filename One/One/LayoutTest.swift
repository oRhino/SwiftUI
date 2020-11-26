//
//  LayoutTest.swift
//  One
//
//  Created by cyzone on 2020/7/31.
//

import SwiftUI

//1. Parent Proposes Size for Child
//2. Child Chooses Its Own Size
//3. Parent Places Child in Parent’s Coordinate Space
//4. SwiftUI rounds coordinates to nearest pixel
struct LayoutTest: View {
    var body: some View {
        
        HStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .background(Color.yellow)
            }.background(Color.green)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Title")
                    .font(.largeTitle)
                Text("This is the latest message")
            }
            .background(Color.blue)
        }
    }
}

struct LayoutTest_Previews: PreviewProvider {
    static var previews: some View {
        LayoutTest()
    }
}
