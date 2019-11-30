//
//  CourseCell.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/28/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

	@IBOutlet weak var shadowView: UIView!
	@IBOutlet weak var baseContentView: UIView!
	@IBOutlet weak var courseLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
		makeCellShadow()
    }
}

extension CourseCell {
	func makeCellShadow() {
		// set the shadow properties
		shadowView.layer.shadowColor = UIColor.black.cgColor
		shadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
		shadowView.layer.shadowOpacity = 1
		shadowView.layer.shadowRadius = 4

		// set the corner radius
		baseContentView.layer.cornerRadius = 7
	}
}

extension CourseCell {
	func update(course: NewCourse) {
		courseLabel.text = course.name
	}
}
