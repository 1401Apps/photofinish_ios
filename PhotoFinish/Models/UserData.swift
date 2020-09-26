//
//  UserData.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 6/2/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject  {
    @Published var submissions = submissionsData
    
    func reset() {
        submissions = submissionsData
    }
    
    func submit(prompt: String) {
        submissions[prompt]!.submitted = true
        submissions[prompt]!.url = "something/" + prompt
    }
    
}
