//
//  StudentController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class StudentController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var buyButtonView: UIView!
	@IBOutlet weak var buyButton: UIButton!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var textContentView: UIView!

	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var skillsLabel: UILabel!
	@IBOutlet weak var moreInfoButton: UIButton!

	//MARK: - Custom variables
	var signedInStudent: Student?
	var allCourses: [Course]?

	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
}

//MARK: - Extension
