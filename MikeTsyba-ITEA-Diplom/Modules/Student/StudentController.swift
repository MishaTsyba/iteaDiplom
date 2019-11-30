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
	var newAllCourses: [NewCourse]?

	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
	@IBAction func didTapSignOutButton(_ sender: Any) {
		let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
		let signInController = authStoryboard.instantiateViewController(withIdentifier: "SignInController") as! SignInController

		self.signedInStudent = nil

		signInController.signedInStudent = self.signedInStudent
		navigationController?.pushViewController(signInController, animated: true)
	}

	@IBAction func didTapBackButton(_ sender: Any) {
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let facultyController = controllers[2] as? FacultyController {
				navigationController?.popToViewController(facultyController, animated: true)
			}
		}
	}

}

//MARK: - Extension
