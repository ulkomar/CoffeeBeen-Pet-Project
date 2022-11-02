//
//  CoordinatorProtocol.swift
//  Coffee Been
//
//  Created by Uladzislau Komar on 2.11.22.
//

import Foundation
import UIKit

typealias CoordinatorHandler = () -> ()

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
