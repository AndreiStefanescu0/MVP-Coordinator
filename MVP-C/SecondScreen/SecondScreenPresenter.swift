//
//  SecondScreenPresenter.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation



class SecondScreenPresenter {
    
    private var name: String
    private var email: String
    
    init( name: String, email: String){
        self.name = name
        self.email = email
    }
    
    func getInfo() -> User {
      return User(name: name, password: "", email: email)
    }
}
