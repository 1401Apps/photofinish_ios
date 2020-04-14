//
//  ContentView.swift
//  PhotoFinish
//
//  Created by Andreas Papazafeiropoulos on 4/13/20.
//  Copyright © 2020 1401Apps. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showImagePicker: Bool = false
    @State private var image: Image? = nil
    
    let server = "http://localhost:8080"
    
    func sendRequest() {
        guard let url = URL(string: server) else {return}
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {return}
            guard let dataString = String(data: data, encoding: String.Encoding.utf8) else {return}
            
            DispatchQueue.main.async {
                print("=========")
                print(dataString)
                print("=========")
            }
        }
        task.resume()
    }
    
    var body: some View {
        VStack {
            image?.resizable()
                .scaledToFit()
                
            Button("TEST SERVER") {
                self.sendRequest()
            }.padding()
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(25)

            Button("Open Camera") {
                self.showImagePicker = true
            }.padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(25)
        }.sheet(isPresented: self.$showImagePicker) {
            PhotoCaptureView(showImagePicker: self.$showImagePicker, image: self.$image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
