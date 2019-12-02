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
	var course: NewCourse?
	var signedInStudent: Student?
	var selectedFaculty: NewFaculty?
	var filteredFacultyCourses = [NewCourse]()
	var newAllCourses = [NewCourse]()
	
	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		designUi()
		setTitleLAbel()
    }

	//MARK: - viewWillAppear

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseController") as! CourseController
		courseController.signedInStudent = self.signedInStudent
		courseController.course = self.course
		courseController.selectedFaculty = self.selectedFaculty
		courseController.newAllCourses = self.newAllCourses
		courseController.filteredFacultyCourses = self.filteredFacultyCourses
		navigationController?.pushViewController(courseController, animated: false)
	}
}
