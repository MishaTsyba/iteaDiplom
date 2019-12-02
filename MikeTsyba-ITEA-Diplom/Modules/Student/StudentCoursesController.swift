//
//  StudentCoursesController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class StudentCoursesController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backGroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var titleViewLabel: UILabel!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!

	@IBOutlet weak var shadowCourseView: UIView!
	@IBOutlet weak var courseTableView: UITableView!

	//MARK: - Custom variables
	var newAllCourses = [NewCourse]()
	var signedInStudent: Student?
	var studentCurrentCourses = [NewCourse]()
	var studentLastCourses = [NewCourse]()
	var studentAllCourses = [[NewCourse]]()
	var selectedFaculty: NewFaculty?
	var fromLastCourses = false

	//output data
	var course: NewCourse?

	//MARK: - viewDidLoad
	override func viewDidLoad() {
		super.viewDidLoad()
		debugPrint("*********** Courses viewDidLoad  **************")

		designUi()
		setTitleLabel()
		makeTableViewSectionsData()

		debugPrint("studentAllCourses: \(String(describing: studentAllCourses))")
		debugPrint("student: \(String(describing: signedInStudent))")

		courseTableView.register(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: "CourseCell")
		courseTableView.delegate = self
		courseTableView.dataSource = self
		courseTableView.reloadData()
	}

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)

		courseTableView.reloadData()
	}

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
		let studentController = studentStoryboard.instantiateViewController(withIdentifier: "StudentController") as! StudentController

		studentController.newAllCourses = self.newAllCourses
		studentController.signedInStudent = self.signedInStudent
		studentController.studentCurrentCourses = self.studentCurrentCourses
		studentController.studentLastCourses = self.studentLastCourses
		studentController.selectedFaculty = self.selectedFaculty
		debugPrint("studentCurrentCourses: \(studentCurrentCourses)")
		debugPrint("studentLastCourses: \(studentLastCourses)")
		
		navigationController?.pushViewController(studentController, animated: false)
	}
}
