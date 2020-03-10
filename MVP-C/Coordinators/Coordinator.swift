//
//  Coordinator.swift
//  MVP-C
//
//  Created by Andrei Stefanescu on 06/02/2020.
//  Copyright © 2020 Andrei Stefanescu. All rights reserved.
//

import Foundation

protocol Deinitcallable: AnyObject {
    var onDeinit: (() -> Void)? { get set }
}

protocol CoordinatorProtocol: AnyObject {
    func start()
    var stop: (() -> Void)? { get set }
    func setDeallocallable(with object: Deinitcallable)
    var deallocallable: Deinitcallable? { get set }
}

extension CoordinatorProtocol {
    func setDeallocallable(with object: Deinitcallable) {
        deallocallable?.onDeinit = nil
        object.onDeinit = {[weak self] in
            self?.stop?()
        }
        deallocallable = object
    }
}

class Coordinator: NSObject, CoordinatorProtocol {
    var stop: (() -> Void)?
    weak var deallocallable: Deinitcallable?
    
    func start() {}
}
