//
//  ContentView.swift
//  One
//
//  Created by cyzone on 2020/7/17.
//

import SwiftUI




struct ContentView:View {

    var body: some View{
        VStack{
            Text("Font applied to a text view.")
                .font(.largeTitle)
            VStack{
                Text("These 2 text views have the same font")
                Text("applied to their parent hierarchy")
            }
        }.font(.system(size: 36, weight: .light, design: .default))

    }
}

//ModifiedContent<VStack<Text>, _EnvironmentKeyWritingModifier<Optional<Font>>>
//struct ContentView:View {
//
//    var  body: some View{
//        VStack{
//            Text("Hello World!").transformEnvironment(\.font) {  dump($0) }
//        }
//        .font(Font.headline)
//        //.debug()
//    }
//
//}


//struct ContentView: View {
//
//    var counter = State(initialValue: 0)
//
//    var body: some View {
//        VStack{
//            Button("Tap me!") { self.counter.wrappedValue += 1 }
//            LabelView(counter: self.counter.projectedValue)
//        }.debug()
//    }
//}
//
//struct LabelView:View{
//
//    @Binding var counter:Int
//
//    var body: some View{
//        Group{
//            if counter > 0 {
//                Text("You've tapped \(counter) times")
//            }
//
//        }
//    }
//
//}


//struct ContentView: View {
//    @State var counter = 0
//
//    var body: some View {
//        VStack{
//            Button("Tap me!") { self.counter += 1 }
//
//            if(counter > 0){
//                Text("You've tapped \(counter) times")
//            }
//
////            Button(action: { self.counter += 1}, label: {
////                Text("Tap me!")
////                    .padding()
////                    .background(Color(.tertiarySystemFill))
////                    .cornerRadius(5)
////            })
////
////            if counter > 0 {
////                Text("You've tapped \(counter) times")
////            }else{
////                Text("You've not yet tapped")
////                Image(systemName: "circle")
////            }
//        }.debug()
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
//VStack<TupleView<(Button<ModifiedContent<ModifiedContent<ModifiedContent<Text, _PaddingLayout>, _BackgroundModifier<Color>>, _ClipEffect<RoundedRectangle>>>, _ConditionalContent<Text, Text>)>>

extension View{
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}


