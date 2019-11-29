//
//  CourseOrderController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/25/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CourseOrderController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var innerContentView: UIView!
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var commentLabel: UILabel!
	@IBOutlet weak var fullNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var commentTextView: UIView!
	@IBOutlet weak var buyButtonView: UIView!
	@IBOutlet weak var buyButton: UIButton!
	@IBOutlet weak var privacyView: UIView!
	@IBOutlet weak var privacyImageView: UIImageView!
	@IBOutlet weak var privacyLabel: UILabel!
	@IBOutlet weak var privacyButton: UIButton!




	//MARK: - Custom variables
	var privacyValid = false

	//input data
	var course: Course?
	
	//input displayed processed output
	var signedInStudent: Student?
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** CourseOrder viewDidLoad  **************")
		debugPrint("student: \(String(describing: signedInStudent))")

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let courseController = controllers[3] as? CourseController {
				navigationController?.popToViewController(courseController, animated: true)
			}
		}
	}

	@IBAction func didTapBuyButton(_ sender: Any) {
	}
	
	@IBAction func didTapConfirmPrivacyButton(_ sender: Any) {
		privacyValid = !privacyValid
		if !privacyValid {
			privacyImageView.image = UIImage(named: "checkBoxUnChecked")
		} else {
			privacyImageView.image = UIImage(named: "checkBoxChecked")
		}
	}
}

//MARK: - Extension
