//
//  ContentView.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI


extension Color {
    static let lightGray = Color("lightGray")
}

struct ContentView: View {
    // Variables
    @State var gameState = gameData[0].state
    var StateButton: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                           .fill(Color.blue)
                           .frame(width: 225, height: 60)
            Button(action: { self.gameState.toggle() }) {
                Text("Change State")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.lightGray
                .edgesIgnoringSafeArea(.all)

                // Other layers will respect the safe area edges
                VStack {
                    HeaderView()
                        .offset(y:-90)
                    Spacer()
                    CircleView(gameState: self.gameState.rawValue)
                        .offset(y:-25)
                    Spacer()
                    StateButton
                    FooterView()
                }
            }
        }        
    }
    
}

struct CircleView: View {
    var gameState: String
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        VStack {
            if gameState == "scheduled" {
                GameScheduled()
            }
            else if gameState == "started" {
                // Reset submissions
                GameStarted(prompts: gameData[0].prompts) // Todo: Make it so it keys off of userData
            }
            else if gameState == "over" {
                GameOver()
                    .onAppear() {
                        self.userData.reset()
                    }
            }
            else {
                GameIdle()
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 5.0) {
            Image("photofinish_logo")
                .resizable()
                .frame(width: 50.0, height: 50.0)
            Text("photofinish")
                .foregroundColor(Color.white)
                .bold()
        }
    }
}

struct FooterView: View {
    var body: some View {
        HStack {
            Text("Sleepy Studios (tm)")
                .font(.footnote)
                .foregroundColor(Color.white)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
