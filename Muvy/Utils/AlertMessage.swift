//
//  AlertMessage.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/4/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import UIKit

class AlertMessage {
    
    static func show(title: String, message: String, view: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        
        view.present(alert, animated: true, completion: nil)
    }
}
