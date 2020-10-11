//
//  CustomModel.swift
//  PhotoFinish
//
//  Created by Andreas Papazafeiropoulos on 9/30/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import Foundation


class CustomModel {
    var title: String
    var subject: String
    
    init(title: String?, subject: String?) {
        self.title = title!
        self.subject = subject!
    }
}
