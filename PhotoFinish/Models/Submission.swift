//
//  Submission.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

struct Submission: Hashable, Codable {
    var submitted: Bool
    var passed: Bool
    var url: String

    // Construct Prompts out of the game prompt data
    // Make a constructor
    init()
    {
        submitted = false
        passed = false
        url = ""
    }
}
