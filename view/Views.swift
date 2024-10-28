//
//  View.swift
//  Learning
//
//  Created by Malak on 27/10/2024.
//
import SwiftUI

struct Views: View {
    
    @StateObject var takeModel: ViewModelTask = ViewModelTask()  // Ensure this matches the class name
    @Namespace var animation
    @State private var navigateToBrownView = false   // State for Brown navigation
    @State private var navigateToBlueView = false    // State for Blue navigation
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                        Section {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(takeModel.currentWeek, id: \.self) { day in
                                        VStack(spacing: 10) {
                                            // Weekday name (e.g., "Mon", "Tue") displayed above the day number
                                            Text(takeModel.extractDate(date: day, format: "EEE"))
                                                .font(.system(size: 14))
                                                .foregroundColor(takeModel.isToday(date: day) ? .primary : .black)

                                            // Day number with a conditional circle background for today
                                            Text(takeModel.extractDate(date: day, format: "dd"))
                                                .font(.system(size: 15))
                                                .fontWeight(.semibold)
                                                .padding(8)
                                                .background(
                                                    Circle()
                                                        .fill(takeModel.isToday(date: day) ? takeModel.todayColor : Color.clear)
                                                )
                                                .foregroundColor(takeModel.isToday(date: day) ? .white : .black) // White text for today
                                        }
                                        .frame(width: 45, height: 90)
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            takeModel.currentDate = day
                                        }
                                    }

                                }
                                .padding(.horizontal)
                            }
                            TaskView()
                        } header: {
                            HeaderView()
                        }
                    }
                }
                
                // Buttons to change today's color
                ZStack {
                    VStack {
                        // Other content here (calendar view, tasks, etc.)
                        
                        Spacer()  // Pushes content up to make space for bottom button
                        
                        // Blue Button at the Bottom Center
                        Button("Freeze day") {
                            takeModel.setTodayColorToBlue()
                            navigateToBlueView = true
                        }
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                        .onChange(of: navigateToBlueView) { newValue in
                            if newValue { navigateToBlueView = false } // Reset after navigation
                        }
                        .padding(.bottom, 30)  // Adjust bottom padding for comfortable placement
                    }
                    
                    // Brown Button in the Center of the Screen as a Circle
                    Button(action: {
                        takeModel.setTodayColorToBrown()
                        navigateToBrownView = true
                    }) {
                        Text("Log To day as Learned")
                            .foregroundColor(.white)
                            .padding(100)
                            .background(Circle().fill(Color.brown))
                    }
                    .onChange(of: navigateToBrownView) { newValue in
                        if newValue { navigateToBrownView = false } // Reset after navigation
                    }
                }

                .padding(.top)
                
                // Navigation links to navigate to color pages
                NavigationLink(destination: BrownDayScreen(), isActive: $navigateToBrownView) {
                    EmptyView()
                }
                NavigationLink(destination: BlueDayScreen(), isActive: $navigateToBlueView) {
                    EmptyView()
                }
            }
        }
    }

    func TaskView() -> some View {
        LazyVStack(spacing: 10) {
            // Task View content here
        }
    }

    func HeaderView() -> some View {
        HStack(spacing: 10) {
            Text(Date().formatted(date: .abbreviated, time: .omitted))
                .foregroundColor(.gray)
            
            Text("Today")
                .font(.largeTitle.bold())
                .hLeading()
            
            Button(action: {
                // Button action here
            }) {
                Text("🔥") // Displaying an emoji
                    .font(.system(size: 45))
                    .clipShape(Circle())
            }
        }
        .padding()
        .background(Color.white)
    }
}

// BrownDayScreen and BlueDayScreen for navigation

struct BrownDayScreen : View {
    var body: some View {
        VStack {
            Text("Log Toady as learned")
                .font(.title)
                .padding()
            Spacer()
        }
        .background(Color.brown)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BlueDayScreen : View {
    var body: some View {
        VStack {
            Text("Today's color is set to Blue!")
                .font(.title)
                .padding()
            Spacer()
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}
