//
//  OnboardingPresenter.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation

protocol OnboardingNavigationDelegate: class {
    func goToNextScreen(name: String, email: String)
    func showError(message: String)
    func goToHelpScreen()
}

class OnboardingPresenter {
    
    private let onboardingService: OnboardingService
    weak var onboardingNavigationDelegate: OnboardingNavigationDelegate?
    
    init(onboardingService: OnboardingService){
        self.onboardingService = onboardingService
    }
    
    func checkInfos(name: String, password: String, email: String) {
        onboardingService.getInfos(name: name, password: password) { (result) in
            if result {
                if email.isValidEmail(email) {
                    onboardingNavigationDelegate?.goToNextScreen(name: name, email: email)
                } else {
                    onboardingNavigationDelegate?.showError(message: "incorrect email")
                }
            } else {
                onboardingNavigationDelegate?.showError(message: "incorrect pass/name")
            }
        }
    }
    
    func goToHelp() {
        onboardingNavigationDelegate?.goToHelpScreen()
    }
}
