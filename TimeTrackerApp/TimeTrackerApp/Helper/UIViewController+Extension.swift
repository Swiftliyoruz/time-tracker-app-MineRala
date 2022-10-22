//
//  UIViewController+Extension.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 30.09.2022.
//

import UIKit

extension UIViewController {
    public func showToast(in view: UIView, message: String, size: CGSize = CGSize(width: 250, height: 50)) {
        let toastLabel = UILabel(frame: CGRect(x: (view.frame.size.width / 2) - 125, y: view.frame.size.height - 150, width: size.width, height: size.height))
        toastLabel.backgroundColor = DefaultColor.black.withAlphaComponent(0.65)
        toastLabel.textColor = DefaultColor.white
        toastLabel.font = UIFont.setFont(type: Font.medium.rawValue, size: 14)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.numberOfLines = 0
        toastLabel.lineBreakMode = .byWordWrapping
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = CornerRadius.high.rawValue
        toastLabel.clipsToBounds = true
        
        if let keyWindow = UIWindow.key {
            keyWindow.addSubview(toastLabel)
            UIView.animate(withDuration: 5, delay: 0.0, options: .curveEaseIn, animations: {
                toastLabel.alpha = 1.0
            }, completion: { _ in
                UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
                    toastLabel.alpha = 0.0
                }, completion: {_ in
                    toastLabel.removeFromSuperview()
                })
            })
        }
    }
}
