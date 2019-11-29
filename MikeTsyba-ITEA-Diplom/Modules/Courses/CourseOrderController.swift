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

	//MARK: - Custom variables

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
	@IBAction func didTapConfirmPrivacyButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let courseController = controllers[3] as? CourseController {
				navigationController?.popToViewController(courseController, animated: true)
			}
		}
	}
}

//MARK: - Extension
