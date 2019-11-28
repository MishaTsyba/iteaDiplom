//
//  CourseDetailesController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/25/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CourseDetailesController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var textContentView: UIView!

	@IBOutlet weak var programLabel: UILabel!
	@IBOutlet weak var requirementsLabel: UILabel!

	//MARK: - Custom variables

	//input data
	var course: Course?
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		designView()

		if let item = course {
			if let courseProgram = item.program {
				programLabel.text = courseProgram
			}
		}

		if let item = course {
			if let courserequirements = item.requirements {
				requirementsLabel.text = courserequirements
			}
		}

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let courseController = controllers[2] as? CourseController {
				navigationController?.popToViewController(courseController, animated: true)
			}
		}
	}
}

//MARK: - Extension
extension CourseDetailesController {
	func designView() {

		// set the titleView shadow properties
		titleView.layer.shadowColor = UIColor.black.cgColor
		titleView.layer.shadowOffset = CGSize(width: 2, height: 2)
		titleView.layer.shadowOpacity = 1
		titleView.layer.shadowRadius = 25

		// set the titleView corner radius
		titleView.layer.cornerRadius = 7

		// set the shadowCollectionView shadow properties
		shadowScrollView.layer.shadowColor = UIColor.black.cgColor
		shadowScrollView.layer.shadowOffset = CGSize(width: 2, height: 2)
		shadowScrollView.layer.shadowOpacity = 1
		shadowScrollView.layer.shadowRadius = 25

		// set the round view for image
		shadowScrollView.clipsToBounds = true
		shadowScrollView.layer.masksToBounds = false

		// set the shadowCollectionView corner radius
		shadowScrollView.layer.cornerRadius = 7

		// set the filterButtonView shadow properties
		backButtonView.layer.shadowColor = UIColor.black.cgColor
		backButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		backButtonView.layer.shadowOpacity = 0.7
		backButtonView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		backButtonView.layer.cornerRadius = 7
	}
}
