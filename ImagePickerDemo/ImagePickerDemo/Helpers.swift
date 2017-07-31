//
//  Helpers.swift
//  ImagePickerDemo
//
//  Created by Akhilesh Gandotra on 17/01/17.
//  Copyright © 2017 Akhilesh Gandotra. All rights reserved.
//

import  UIKit

extension UIViewController {
    func showAlertWith(message: String) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (finished) in
            
        }
        alert.addAction(ok)
        DispatchQueue.main.async(execute: { () -> Void in
            self.present(alert, animated: true, completion: nil)
        })
    }
    
}

extension UIApplication {
    class func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(top)
            } else if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
}
