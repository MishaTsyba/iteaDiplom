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

	//output data
	var course: NewCourse?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** Courses viewDidLoad  **************")
		designViews(view: titleView)
		designViews(view: backButtonView)
		designViews(view: shadowCourseView)
		designLabels(view: titleViewLabel)

		debugPrint("student: \(String(describing: signedInStudent))")
		courseTableView.register(UINib(nibName: "CourseCell", bundle: nil), forCellReuseIdentifier: "CourseCell")
		courseTableView.reloadData()
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		filteredFacultyCourses = []
		debugPrint("*********** courses viewWillAppear  **************")
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("signedInStudent: \(String(describing: self.signedInStudent))")
		debugPrint("selectedFaculty: \(String(describing: self.selectedFaculty))")
		debugPrint("allCourses: \(String(describing: self.newAllCourses))")
		debugPrint("filteredFacultyCourses: \(String(describing: filteredFacultyCourses))")

		debugPrint("*********** courses Time Filtering  **************")
		makeFilteredCourses()
		if filteredFacultyCourses.count == 0 {
			noCoursesAlert()
		}

		if let faculty = selectedFaculty {
			titleViewLabel.text = faculty.name
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
		navigationController?.pushViewController(facultyController, animated: false)
	}
}

//MARK: - TableView Delegate Extension
extension CoursesController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return filteredFacultyCourses.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
		cell.update(course: filteredFacultyCourses[indexPath.row])
		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		debugPrint("*********** Courses didSelectRowAt  **************")

		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseController") as! CourseController
		
		courseController.filteredFacultyCourses = self.filteredFacultyCourses
		courseController.course = filteredFacultyCourses[indexPath.row]
		courseController.signedInStudent = self.signedInStudent

		debugPrint("course: \(filteredFacultyCourses[indexPath.row])")
		debugPrint("signedInStudent: \(String(describing: signedInStudent))")
		navigationController?.pushViewController(courseController, animated: false)
	}

}

//MARK: - Filter Courses extension
extension CoursesController {
	func makeFilteredCourses() {
		if let newFaculty = selectedFaculty {
			if let newCourses = newAllCourses {
				for newCourse in newCourses {
					if newCourse.faculty == newFaculty.name {
						if timeFilterFacultyValues.isEmpty {
							filteredFacultyCourses.append(newCourse)
						} else if timeFilterFacultyValues.contains(time.day) {
							if newCourse.time == time.day {
								filteredFacultyCourses.append(newCourse)
							}
						} else if timeFilterFacultyValues.contains(time.evening) {
							if newCourse.time == time.evening {
								filteredFacultyCourses.append(newCourse)
							}
						}
					}
				}
			}
		}
	}
}
//MARK: - Alert extension
extension CoursesController {
	func noCoursesAlert() {
		let alertController = UIAlertController(title: "Sorry", message: "No available Courses this time", preferredStyle: .alert)

		let actionFirst = UIAlertAction(title: "Return", style: .default)

		let cancelFirst = UIAlertAction(title: "Cancel", style: .cancel)

		alertController.addAction(actionFirst)
		alertController.addAction(cancelFirst)

		present(alertController, animated: true, completion: nil)
	}
}

//MARK: - Design UI Extension
extension CoursesController {

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
