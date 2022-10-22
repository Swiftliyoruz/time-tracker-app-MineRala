//
//  AlertPresentable.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 9.10.2022.
//

import UIKit

protocol AlertPresentable {
    func showAlert(message: String, indexPath: IndexPath, deletion: @escaping () -> Void)
    func showToast(in view: UIView, message: String, size: CGSize)
}

extension AlertPresentable where Self: UIViewController {
    func showAlert(message: String, indexPath: IndexPath, deletion: @escaping () -> Void) {
        let dialogMessage = UIAlertController(title: NSLocalizedString("Deletion Confirmation", comment: ""), message: message, preferredStyle: .alert)
        let deleteAction = UIAlertAction(title: NSLocalizedString("Delete", comment: ""), style: .default, handler: { (action) in
         deletion()
         })
        deleteAction.setValue(UIColor.red, forKey: "titleTextColor")
         dialogMessage.addAction(deleteAction)

        dialogMessage.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: { (action) in
            print("cancel is tapped.")
         }))
         present(dialogMessage, animated: true, completion: {})
    }
    
    func showToast(in view: UIView, message: String, size: CGSize = CGSize(width: 250, height: 50)) {
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
