//
//  PromptCircle.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

class ImageInput: ObservableObject {
    @State var image: Image? = nil
    //@State var showView: Bool = false
    @State var curPrompt: String? = "Null"
    @State var showCaptureImageView: Bool = true
}

struct PromptCircle: View {
    // Incoming argument: array of all of the scavenger hunt prompts
    var prompts: [String]

    // Mutable Variables
    @State var image: Image? = nil
    @State var showView: Bool = false
    @State var curPrompt: String? = "Null"
    @State var showCaptureImageView: Bool = true
    @EnvironmentObject var userData: UserData
    
    var num_prompts: Double
    {
        return Double(prompts.count)
    }
    
    // Used in the ForEach loop to iterate over each Pizza slice
    var intArray: Range<Int>
    {
        return (0..<Int(num_prompts))
    }
    
    // Hardcoded constants - I-L-L
    let colors = [Color.blue, Color.orange]
    
    var body: some View {
        VStack {
            // Go to Camera View if isShowingCameraView is true
            NavigationLink(destination: CameraView(image: self.$image, showView: self.$showView, curPrompt: self.$curPrompt), isActive: self.$showView)
            {
                EmptyView()
            }
            ZStack {
                ForEach(intArray, id: \.self) { item in
                    // Handle color selection here
                    PromptSlice(prompts: self.num_prompts, color: self.userData.submissions[self.prompts[item]]!.submitted ? Color.lightGray : self.colors[item % 2]) // Make grey if submitted else orange/blue
                        .rotationEffect(.degrees(360/self.num_prompts * Double(item))) // Rotate slice by number of 360/prompts
                        .onTapGesture {
                            // Set current prompt to the prompt associated with this slice
                            self.curPrompt = self.prompts[item]
                            // Toggle CameraView on
                            self.showView = true
                            // Set state of prompt to submitted
                            self.userData.submit(prompt: self.prompts[item])
                        }
                    .allowsHitTesting(!(self.userData.submissions[self.prompts[item]]!.submitted)) //  Interactable if not submitted
                }
            }
        }
    }
}

struct PromptCircle_Previews: PreviewProvider {
    static var previews: some View {
        PromptCircle(prompts: ["Test1", "Test2", "Test3", "Test4", "Test5", "Test6"])
    }
}
