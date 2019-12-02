//
//  CoursesController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CoursesController: UIViewController {

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
	let time = Time()

	//input data
	var selectedFaculty: NewFaculty?
	var newAllCourses: [NewCourse]?
	var timeFilterFacultyValues = [String]()

	//displayed data
	var filteredFacultyCourses = [NewCourse]()

	//transfer data
	var signedInStudent: Student?
	var savedTimeFilterFacultyValues = [String]()
	var savedTypeFilterFacultyValues = [String]()

	//output data
	var course: NewCourse?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** Courses viewDidLoad  **************")
		debugPrint("student: \(String(describing: signedInStudent))")
		designUi()
		setTitleLAbel()

		courseTableView.register(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: "CourseCell")
		courseTableView.reloadData()
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		debugPrint("*********** courses viewWillAppear  **************")
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("signedInStudent: \(String(describing: self.signedInStudent))")
		debugPrint("selectedFaculty: \(String(describing: self.selectedFaculty))")
		debugPrint("allCourses: \(String(describing: self.newAllCourses))")
		debugPrint("filteredFacultyCourses: \(String(describing: filteredFacultyCourses))")
		debugPrint("*********** courses Time Filtering  **************")
		debugPrint("filteredFacultyCourses: \(String(describing: filteredFacultyCourses))")

		makeFilteredCourses()

		if filteredFacultyCourses.count == 0 {
			noCoursesAlert()
		}

		courseTableView.reloadData()
    }

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController
		facultyController.signedInStudent = self.signedInStudent
		facultyController.course = self.course
		facultyController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
		facultyController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
		navigationController?.pushViewController(facultyController, animated: false)
	}
}
