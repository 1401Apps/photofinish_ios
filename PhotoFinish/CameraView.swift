//
//  CameraView.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

// Placeholder Camera screen
// TODO: Implement camera
struct CameraView: View {
    @Binding var image: Image?
    @Binding var showView: Bool
    @Binding var curPrompt: String?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            
            CaptureImageView(isShown: self.$showView, image: $image)
            .edgesIgnoringSafeArea(.all)

            VStack{
                ZStack {
                    Rectangle()
                        .frame(height: 125.0) // Todo make dynamic
                        .foregroundColor(.lightGray)
                        .edgesIgnoringSafeArea(.all)

                    Text(curPrompt!)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .offset(x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -125)
                }
                Spacer()
            }
        }
    }
}

struct CameraButton: View {
    var body: some View {
        Circle()
            .padding()
            .frame(width: 120.0, height: 120.0)
            .foregroundColor(.red)
            .overlay(
        Circle()
            .stroke(Color.white, lineWidth: 5)
            .frame(width: 100, height: 100)
        )
    }
}

struct CaptureImageView {
    
    /// MARK: - Properties
    @Binding var isShown: Bool
    @Binding var image: Image?
    
    func makeCoordinator() -> Coordinator {
      return Coordinator(isShown: $isShown, image: $image)
    }
}
extension CaptureImageView: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<CaptureImageView>) {
        
    }
}

//struct CameraView_Previews: PreviewProvider {
//    static var previews: some View {
        //CameraView(image: nil, showView: true, curPrompt: "Test")
//    }
//}
