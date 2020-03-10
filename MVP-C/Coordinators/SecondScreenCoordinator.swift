//
//  SecondScreenCoordinator.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenCoordinator {
    private var navigationController: UINavigationController
    private var name: String
    private var email: String
    
    init(navigationController: UINavigationController, name: String, email: String) {
        self.name = name
        self.email = email
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(false, animated: false)
        let backButton = UIBarButtonItem()
        backButton.title = "Onboarding"
        navigationController.navigationBar.topItem?.backBarButtonItem = backButton
        navigationController.navigationBar.tintColor = UIColor.black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController.navigationBar.titleTextAttributes = textAttributes
        navigationController.navigationBar.barTintColor = UIColor.white
    }
    
    func start() {
        let secondScreenPresenter = SecondScreenPresenter(name: name, email: email)
        let secondVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "SecondScreenViewController") as! SecondScreenViewController
        secondVC.secondScreenPresenter = secondScreenPresenter
        navigationController.pushViewController(secondVC, animated: false)
    }
}
