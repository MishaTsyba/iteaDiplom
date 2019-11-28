//
//  CourseController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CourseController: UIViewController {

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

	//transfer data
	var course: Course?
	var signedInStudent: Student?
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

		if let item = course {
			if let courseName = item.name {
				titleLabel.text = courseName
			}
		}

		if let item = course {
			if let courseDescription = item.description {
				descriptionLabel.text = courseDescription
			}
		}

		if let item = course {
			if let courseSkills = item.skills {
				skillsLabel.text = courseSkills
			}
		}

		designView()
    }

	//MARK: - viewWillAppear
	

	//MARK: - Button Actions
	@IBAction func didTapMoreInfoButton(_ sender: Any) {
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseDetailsController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseDetailesController") as! CourseDetailesController

		courseDetailsController.course = self.course

		debugPrint("course: \(String(describing: course))")
		navigationController?.pushViewController(courseDetailsController, animated: true)
	}

	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let coursesController = controllers[1] as? CoursesController {
				navigationController?.popToViewController(coursesController, animated: true)
			}
		}
	}

	@IBAction func didTapBuyButton(_ sender: Any) {
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseOrderController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseOrderController") as! CourseOrderController

		courseOrderController.signedInStudent = self.signedInStudent

		debugPrint("course: \(String(describing: course))")
		navigationController?.pushViewController(courseOrderController, animated: true)
	}
}

//MARK: - Extension
extension CourseController {
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

		// set the filterButtonView shadow properties
		buyButtonView.layer.shadowColor = UIColor.black.cgColor
		buyButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		buyButtonView.layer.shadowOpacity = 0.7
		buyButtonView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		buyButtonView.layer.cornerRadius = 7
	}
}
