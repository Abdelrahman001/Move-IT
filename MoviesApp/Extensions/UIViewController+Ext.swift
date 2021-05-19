//
//  UIViewController+Ext.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import UIKit

var vSpinner : UIView?

extension UIViewController {
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    func showSpinner(onView : UIView) {
        DispatchQueue.main.async {
            let spinnerView = UIView.init(frame: onView.bounds)
            spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
            let ai = UIActivityIndicatorView.init(style: .large)
            ai.startAnimating()
            ai.center = spinnerView.center
            
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        
            vSpinner = spinnerView
        }
    }
}
