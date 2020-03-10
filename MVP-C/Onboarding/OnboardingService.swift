//
//  OnboardingService.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation

class OnboardingService {
    
    func getInfos(name: String, password: String, completion: (Bool) -> Void) {
        let infos = [User(name: "test", password: "test", email: ""),
                     User(name: "andrei", password: "ierdna", email: ""),
                     User(name: "bla", password: "bla", email: "")]
        
        if infos.first(where: { $0.name == name && $0.password == password }) != nil {
            completion(true)
        } else {
            completion(false)
        }
    }
}
