//
//  ContentView.swift
//  Learning
//
//  Created by Malak on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""

    
    var body: some View {
       ZStack {
            Color.black
                .ignoresSafeArea()
        
           
            Circle()
               .fill(Color.gray)
               .frame(width: 150, height: 150)
               .opacity(0.2)
               .padding(.bottom , 450)
        
           
           Text("🔥")
               .padding(.bottom, 450)
               .font(.system(size: 70))
           
           VStack (alignment: .leading ) {
               
               
               Text("Hello Learner!")
                   .foregroundColor(.white)
                   .font(.largeTitle)
                   .bold()
               
               Spacer()
                   .frame(height: 10)
               
               Text("This app will help you learn everday")
                   .foregroundColor(.white)
                   .opacity(0.3)
                   .font(.system(size: 18))
               
               Spacer()
                   .frame(height: 50)

               Text("I want to learn")
                   .foregroundColor(.white)
                   .font(.system(size: 18))
    
               
           }
           .padding(.trailing, 70)
        

           
           TextField("Swift", text: $name)
                      .textFieldStyle(.plain)
                      .keyboardType(.default)
                      .font(.system(size: 18))
                      .padding(.top, 200)
                      .padding(.leading, 30)
               
           Rectangle()
               .fill(Color.gray)
               .frame(height: 1)
               .padding(.top, 250)
               .opacity(0.3)
               .padding()
                           
           HStack {
               
            
            
               
               
               
        }
           }
           
        }
        
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
