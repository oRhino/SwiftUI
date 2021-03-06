//
//  FirstView.swift
//  One
//
//  Created by cyzone on 2020/7/24.
//

import SwiftUI

struct FirstView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        
        
        ZStack{
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color.red : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
//                .rotation3DEffect(Angle(degrees: 50), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.easeIn(duration: 0.7))
                .offset(x: viewState.width, y: viewState.height)
            
            CardView()
                .background(show ? Color.red : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
//                .rotation3DEffect(Angle(degrees: 40), axis: (x: 10.0, y: 10.0, z: 10.0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
//                .rotation3DEffect(Angle(degrees: 30), axis: (x: 10.0, y: 10.0, z: 10.0))
                .animation(.spring())
                .onTapGesture{
                    self.show.toggle()
                }
                .gesture(DragGesture()
                            .onChanged{ value in
                                self.viewState = value.translation
                                self.show = true
                            }
                            .onEnded{ value in
                                self.viewState = CGSize.zero
                                self.show = false
                            }
                )
            
        }
    }
}


struct TitleView:View {
    var body: some View{
        VStack{
            HStack{
                
                Text("Hello world")
                    .foregroundColor(.black)
                    .bold()
                
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    Spacer()
                }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
    
}


struct CardView:View {
    var body: some View{
        VStack{
            Text("Card back")
        }
        .frame(width: 340, height: 220)

        
    }
    
}

struct CertificateView:View {
    var body: some View{
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("UI Design")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor((Color("accent")))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor((Color.white))
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            
            Image("Background")
        }
        .frame(width: 340, height: 220)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 20)
    }
}

struct CardBottomView : View {
    var body: some View{
        
        VStack{
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
        
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
