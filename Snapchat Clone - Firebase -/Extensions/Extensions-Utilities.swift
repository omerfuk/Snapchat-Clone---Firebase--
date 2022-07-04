//
//  Extensions-Utilities.swift
//  Snapchat Clone - Firebase -
//
//  Created by Ömer Faruk Kılıçaslan on 4.07.2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func makeAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
