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

	//input data
	var selectedFaculty: Faculty?
	var allCourses: [Course]?
	var timeFilterFacultyValues = [String]()

	//displayed data
	var filteredFacultyCourses = [Course]()

	//transfer data
	var signedInStudent: Student?

	//output data
	var course: Course?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		designView()
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
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.name)))")
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.imageName))")
		debugPrint("allCourses: \(String(describing: self.allCourses))")
		debugPrint("filteredFacultyCourses: \(String(describing: filteredFacultyCourses))")

		debugPrint("*********** courses Time Filtering  **************")
		makeFilteredCourses()
		if filteredFacultyCourses.count == 0 {
			noCoursesAlert()
		}

		if let faculty = selectedFaculty {
			if let facultyName = faculty.name {
				titleViewLabel.text = facultyName
			}
		}

		courseTableView.reloadData()
    }

	//MARK: - Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {

			if let facultyController = controllers[1] as? FacultyController {
				navigationController?.popToViewController(facultyController, animated: true)
			}
		}
	}
}

//MARK: - Extension

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

		courseController.course = filteredFacultyCourses[indexPath.row]
		courseController.signedInStudent = self.signedInStudent

		debugPrint("course: \(filteredFacultyCourses[indexPath.row])")
		debugPrint("signedInStudent: \(String(describing: signedInStudent))")
		navigationController?.pushViewController(courseController, animated: true)
	}

}

//MARK: - Filter Courses extension
extension CoursesController {

	func makeFilteredCourses() {
		if let faculty = selectedFaculty {
			if let facultyName = faculty.name {
				debugPrint("facultyName: \(facultyName)")
				if let courses = allCourses {
					for course in courses {
						if let courseFaculty = course.faculty {
							if courseFaculty == facultyName {
								if timeFilterFacultyValues.isEmpty {
									filteredFacultyCourses.append(course)
								} else if timeFilterFacultyValues.contains("Day") {
									if let courseDay = course.day {
										if courseDay == "Day" {
											filteredFacultyCourses.append(course)
										}
									}
								} else if timeFilterFacultyValues.contains("Evening") {
									if let courseEvening = course.evening {
										if courseEvening == "Evening" {
											filteredFacultyCourses.append(course)
										}
									}
								} else {
									timeFilterFacultyValues = []
								}
							}
						}
					}
				}
			}
		}
	}
}

extension CoursesController {
	func designView() {

		// set the titleView shadow properties
		titleView.layer.shadowColor = UIColor.black.cgColor
		titleView.layer.shadowOffset = CGSize(width: 2, height: 2)
		titleView.layer.shadowOpacity = 1
		titleView.layer.shadowRadius = 25

		// set the titleView corner radius
		titleView.layer.cornerRadius = 7

		// set the shadowCollectionView shadow properties
		shadowCourseView.layer.shadowColor = UIColor.black.cgColor
		shadowCourseView.layer.shadowOffset = CGSize(width: 2, height: 2)
		shadowCourseView.layer.shadowOpacity = 1
		shadowCourseView.layer.shadowRadius = 25

		// set the round view for image
		shadowCourseView.clipsToBounds = true
		shadowCourseView.layer.masksToBounds = false

		// set the shadowCollectionView corner radius
		shadowCourseView.layer.cornerRadius = 7

		// set the filterButtonView shadow properties
		backButtonView.layer.shadowColor = UIColor.black.cgColor
		backButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		backButtonView.layer.shadowOpacity = 0.7
		backButtonView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		backButtonView.layer.cornerRadius = 7
	}
}

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
