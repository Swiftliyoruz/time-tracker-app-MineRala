//
//  TaskTableViewCell.swift
//  TimeTrackerApp
//
//  Created by Mine Rala on 18.09.2022.
//

import UIKit

final class TaskTableViewCell: UITableViewCell {
    @IBOutlet private weak var cardView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var tagView: UIView!
    @IBOutlet private weak var tagTwoView: UIView!
    @IBOutlet private weak var tagLabel: UILabel!
    @IBOutlet private weak var tagTwoLabel: UILabel!
    @IBOutlet private weak var playButtton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        print( cardView.frame.height)
        self.cardView.layer.cornerRadius = 4
        self.tagView.layer.cornerRadius = 4
        self.tagTwoView.layer.cornerRadius = 4
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        self.cardView.backgroundColor = Color.cellBackgroundColor
        self.tagView.backgroundColor = Color.cellTagViewColor
        self.tagTwoView.backgroundColor = Color.cellTagViewTwoColor
        self.tagLabel.textColor = Color.cellTagViewLabelTextColor
        self.tagTwoLabel.textColor = Color.cellTagViewTwoLabelTextColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
    
}
