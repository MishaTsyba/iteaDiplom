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
	var studentCurrentCourse: NewCourse?
	var studentCompletedCourses = [NewCourse]()

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

//		designViews(view: titleView)
//		designViews(view: shadowScrollView)
//		designLabels(view: titleLabel)
//		designIcons(view: logoImageView)
    }

	//MARK: - viewWillAppear

	//MARK: - Sign Out Button Actions
	@IBAction func didTapSignOutButton(_ sender: Any) {
		let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
		let signInController = authStoryboard.instantiateViewController(withIdentifier: "SignInController") as! SignInController

		self.signedInStudent = nil

		signInController.signedInStudent = self.signedInStudent
		navigationController?.pushViewController(signInController, animated: false)
	}

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let facultyController = controllers[2] as? FacultyController {
				navigationController?.popToViewController(facultyController, animated: false)
			}
		}
	}

}

//MARK: - Design UI Extension
extension StudentController {

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
