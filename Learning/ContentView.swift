//
//  ContentView.swift
//  Learning
//
//  Created by Malak on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var name: String = ""
    @State private var selectedOption: String = "None"
    @State private var startbutton: String = "None"
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    // Circle with emoji at the top
                    ZStack {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 150, height: 150)
                            .opacity(0.2)
                        
                        Text("🔥")
                            .font(.system(size: 70))
                    }
                    .padding(.bottom, 30)
                    
                    // Text for welcoming learner
                    VStack (alignment: .leading ) {
                        Text("Hello Learner!")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                        
                        Spacer().frame(height: 10)
                        
                        Text("This app will help you learn everyday")
                            .foregroundColor(.white)
                            .opacity(0.3)
                            .font(.system(size: 18))
                        
                        Spacer().frame(height: 50)
                        
                        Text("I want to learn")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .bold()
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 75)
                    
                    // TextField for entering learning topic
                    TextField(("Swift"), text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.top, 10)
                    
                    // Separator line
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1)
                        .opacity(0.3)
                        .padding()
                    
                    // Text for duration selection
                    Text("I want to learn it in a")
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .bold()
                        .padding(.leading, 30)
                        .padding(.top, 20)
                    
                    // HStack for duration buttons
                    HStack(spacing: 20) {
                        Button(action: {
                            selectedOption = "Week"
                        }) {
                            Text("Week")
                                .padding()
                                .background(selectedOption == "Week" ? Color.orange : Color.secondary)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedOption = "Month"
                        }) {
                            Text("Month")
                                .padding()
                                .background(selectedOption == "Month" ? Color.orange : Color.secondary)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        
                        Button(action: {
                            selectedOption = "Year"
                        }) {
                            Text("Year")
                                .padding()
                                .background(selectedOption == "Year" ? Color.orange : Color.secondary)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.top, 20)
                   
                    
                    NavigationLink(destination: Views()) {
                                           HStack {
                                               Text("Start")
                                                   .font(.title2)
                                                   .bold()
                                                   .foregroundColor(.white)
                                               
                                               Spacer()
                                               
                                               // Arrow with line
                                               HStack(spacing: 4) {
                                                   Rectangle()
                                                       .fill(Color.white)
                                                       .frame(width: 50, height: 2)
                                                   
                                                   Image(systemName: "arrow.right")
                                                       .foregroundColor(.white)
                                                       .font(.title2)
                                               }
                                           }
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color.orange)
                                           .cornerRadius(10)
                                           .padding(.horizontal)
                                           .padding(.top, 30)
                                       }
                                       
                                       Spacer()
                                   }
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
    

