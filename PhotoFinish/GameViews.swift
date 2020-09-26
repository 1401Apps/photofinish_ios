//
//  GameStarted.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

struct GameIdle: View {
    var body: some View {
        ZStack {
        Circle()
            .foregroundColor(.white)
            .padding(.all, 15)
            .shadow(radius: 10) // TODO: Geometry Reader
        
        Text("Stay Tuned!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("lightGray"))
            .multilineTextAlignment(.center)
            .padding(.all)
        }
    }
}

struct GameScheduled: View {
    var body: some View {
        ZStack {
        Circle()
            .foregroundColor(.white)
            .padding(.all, 15)
            .shadow(radius: 10) // TODO: Geometry Reader
        
        Text("Game is starting soon!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(Color("lightGray"))
            .multilineTextAlignment(.center)
            .padding(.all)
        }
    }
}
    
struct GameStarted: View {
    var prompts: [String]
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .padding(.all, 15)
                .shadow(radius: 10) // TODO: Geometry Reader
            
            PromptCircle(prompts: prompts)
        }
    }
}
    
struct GameOver: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .padding(.all, 15)
                .shadow(radius: 10) // TODO: Geometry Reader
            
            Text("Game has ended!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color("lightGray"))
                .multilineTextAlignment(.center)
                .padding(.all)
        }
    }
}

struct GameViews_Previews: PreviewProvider {
    static var previews: some View {
        GameStarted(prompts: ["Test", "Test2"])
    }
}
