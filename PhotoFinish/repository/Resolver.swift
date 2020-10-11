//
//  Resolver.swift
//  PhotoFinish
//
//  Created by Andreas Papazafeiropoulos on 9/30/20.
//  Copyright © 2020 Sleepy Studios. All rights reserved.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static final registerAllServices() {
        register {
            FireStoreCustomRepository() as CustomRepository
        }
        .score
    }
}
