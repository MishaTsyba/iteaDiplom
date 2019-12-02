//
//  FacultyCell.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/27/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class FacultyCell: UICollectionViewCell {

	//MARK: - Outlet variables
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var shadowView: UIView!
	@IBOutlet weak var cellContentView: UIView!
	@IBOutlet weak var cellPhotoView: UIView!
	@IBOutlet weak var cellPhotoImageView: UIImageView!
	@IBOutlet weak var cellTitleLabel: UILabel!


	override func awakeFromNib() {
			super.awakeFromNib()

			// set the shadow properties
			shadowView.layer.shadowColor = UIColor.black.cgColor
			shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
			shadowView.layer.shadowOpacity = 1
			shadowView.layer.shadowRadius = 3

			// set the corner radius
			cellContentView.layer.cornerRadius = 10

			// set the round view for image
			cellPhotoView.clipsToBounds = true
			cellPhotoView.backgroundColor = UIColor.clear
			cellPhotoView.layer.shadowColor = UIColor.black.cgColor
			cellPhotoView.layer.shadowOffset = CGSize(width: 1, height: 1)
			cellPhotoView.layer.shadowOpacity = 1
			cellPhotoView.layer.shadowRadius = 2
		}

	}

	//MARK: - Outlet variables
	extension FacultyCell {
		func update(faculty: NewFaculty) {
			cellTitleLabel.text = faculty.name
			cellPhotoImageView.image = UIImage(named: faculty.imageName)
		}
	}
