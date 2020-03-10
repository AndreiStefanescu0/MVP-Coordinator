//
//  ThirdScreenCoordinator.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation
import UIKit

class ThirdScreenCoordinator {
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
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
        let thirdVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "ThirdScreenViewController") as! ThirdScreenViewController
        navigationController.pushViewController(thirdVC, animated: false)
    }
}
