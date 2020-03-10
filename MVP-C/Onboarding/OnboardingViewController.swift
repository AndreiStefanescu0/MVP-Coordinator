//
//  OnboardingViewController.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    
    var onboardingPresenter: OnboardingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func didTapCheckButton(_ sender: Any) {
        onboardingPresenter?.checkInfos(name: nameTextField.text!, password: passwordTextField.text!, email: emailTextField.text!)
    }
    
    @IBAction func didTapHelpButton(_ sender: Any) {
        onboardingPresenter?.goToHelp()
    }
}
