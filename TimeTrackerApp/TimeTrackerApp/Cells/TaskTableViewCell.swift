//
//  TaskTableViewCell.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 18.09.2022.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        self.cardView.layer.cornerRadius = 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
