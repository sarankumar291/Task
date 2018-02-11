//
//  ActivityTableVIewCell.swift
//  Task
//
//  Created by Sarankumar on 11/02/18.
//  Copyright © 2018 Saran. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class ActivityTableVIewCell: UITableViewCell {
    private let leadingConstant: CGFloat = 20.0
    private let trailingConstant: CGFloat = -20.0
    private let topAndBottomConstant: CGFloat = 10.0
    private let imageViewHeightConstant: CGFloat = 100.0
    
    let profileImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let bottomLineView = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.setupView()
    }
    
    private func setupView() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(bottomLineView)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        profileImageView.contentMode = .scaleAspectFit
        bottomLineView.backgroundColor = UIColor.bottomLine

        let safeView = contentView.safeAreaLayoutGuide
        
        let tLleadingConstraint    = titleLabel.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: leadingConstant)
        let tLtrailingConstraint   = titleLabel.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: trailingConstant)
        let tLtopConstraint        = titleLabel.topAnchor.constraint(equalTo: safeView.topAnchor, constant: topAndBottomConstant)
        
        let iVleadingConstraint    = profileImageView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: leadingConstant)
        let iVtrailingConstraint   = profileImageView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: trailingConstant)
        let iVtopConstraint        = profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: topAndBottomConstant)
        let iVHeightConstraint     = profileImageView.heightAnchor.constraint(equalToConstant: imageViewHeightConstant)
        
        let dLleadingConstraint    = descriptionLabel.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: leadingConstant)
        let dLtrailingConstraint   = descriptionLabel.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: trailingConstant)
        let dLtopConstraint        = descriptionLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: topAndBottomConstant)
        
        let bLleadingConstraint    = bottomLineView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor, constant: leadingConstant)
        let bLtrailingConstraint   = bottomLineView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor, constant: trailingConstant)
        let bLtopConstraint        = bottomLineView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: topAndBottomConstant)
        let bLbottomConstraint     = bottomLineView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor, constant: -1.0)
        let bLHeightConstraint     = bottomLineView.heightAnchor.constraint(equalToConstant: 1.0)
        
        contentView.addConstraints([tLleadingConstraint, tLtrailingConstraint, tLtopConstraint, iVleadingConstraint, iVtrailingConstraint, iVtopConstraint, iVHeightConstraint, dLleadingConstraint, dLtrailingConstraint, dLtopConstraint, bLleadingConstraint, bLtrailingConstraint, bLtopConstraint, bLbottomConstraint, bLHeightConstraint])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(object activity: Activity?) {
        self.titleLabel.text = activity?.title
        self.descriptionLabel.text = activity?.descriptionText
        if let url = activity?.icon {
            self.profileImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "Upload_Image"))
        } else {
             self.profileImageView.image = UIImage(named: "Upload_Image")
        }
    }
}
