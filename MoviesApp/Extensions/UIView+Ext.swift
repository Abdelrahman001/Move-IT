//
//  UIView+Ext.swift
//  MoviesApp
//
//  Created by Abdelrahman Hassan on 19/05/2021.
//

import UIKit

var mSpinner : UIView?

extension UIView {
    
    func removeSpinner() {
        DispatchQueue.main.async {
            mSpinner?.removeFromSuperview()
            mSpinner = nil
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
        
            mSpinner = spinnerView
        }
    }
}
