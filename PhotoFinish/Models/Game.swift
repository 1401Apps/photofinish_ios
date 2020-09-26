//
//  Game.swift
//  PhotoFinish
//
//  Created by Saoud Almulla on 5/31/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import SwiftUI

struct Game: Hashable, Codable, Identifiable {
    var id: Int
    var state: GameState
    var prompts: [String]

    // Enums
    enum GameState: String, CaseIterable, Codable {
        case idle
        case scheduled
        case started
        case over

        // Making toggle work with enums
        mutating func toggle() {
            switch self {
                case .idle:
                    self = .scheduled
                case .scheduled:
                    self = .started
                case .started:
                    self = .over
                case .over:
                    self = .idle
            }
        }
    }
}
