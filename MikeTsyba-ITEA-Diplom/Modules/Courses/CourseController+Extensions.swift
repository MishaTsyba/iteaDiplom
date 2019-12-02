//
//  CourseController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - Design Controller UI Extension
extension CourseController {
	func designUi() {
		designViews(view: titleView)
		designViews(view: buyButtonView)
		designViews(view: backButtonView)
		designViews(view: shadowScrollView)
		designViews(view: moreInfoButton)
		designLabels(view: titleLabel)
		designLabels(view: descriptionLabel)
		designLabels(view: skillsLabel)
	}

	func setTitleLAbel() {
		if let item = course {
			titleLabel.text = item.name
			descriptionLabel.text = item.description
			skillsLabel.text = item.skills
		}
	}
}

//MARK: - Design UI elements Extension
extension CourseController {

	//MARK: - Design UI
	func designViews(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.9
		view.layer.shadowRadius = 3

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}

	//MARK: - Design Labels
	func designLabels(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.7
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 0
	}

	//MARK: - Design Icons
	func designIcons(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.4
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}
}
