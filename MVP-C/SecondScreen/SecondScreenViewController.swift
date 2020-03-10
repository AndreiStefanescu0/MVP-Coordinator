//
//  SecondScreenViewController.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation
import UIKit

class SecondScreenViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    var secondScreenPresenter: SecondScreenPresenter?
    var name: String?
    var email: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        emailTextField.text = secondScreenPresenter?.getInfo().email
        nameTextField.text = secondScreenPresenter?.getInfo().name
    }
}
