//
//  AppCoordinator.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    var sessionExpired = false
    var name: String?
    var email: String?
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.setNavigationBarHidden(true, animated: false)
    }
    
    override func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.setNavigationBarHidden(true, animated: true)
        let onboardingPresenter = OnboardingPresenter(onboardingService: OnboardingService())
        onboardingPresenter.onboardingNavigationDelegate = self
        let onboardingVC = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        onboardingVC.onboardingPresenter = onboardingPresenter
        rootViewController.pushViewController(onboardingVC, animated: false)
    }
}

extension AppCoordinator : OnboardingNavigationDelegate {
    
    func showError(message: String) {
        let alertController = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(okAction)
        rootViewController.present(alertController, animated: true)
    }
    
    func goToNextScreen(name: String, email: String) {
        let nextScreenCoordinator = SecondScreenCoordinator(navigationController: rootViewController, name: name, email: email)
        nextScreenCoordinator.start()
    }
    
    func goToHelpScreen() {
        let helpScreen = ThirdScreenCoordinator(navigationController: rootViewController)
        helpScreen.start()
    }
}
