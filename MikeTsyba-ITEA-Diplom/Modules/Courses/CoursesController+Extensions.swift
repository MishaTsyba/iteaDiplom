//
//  CoursesController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - Design Controller UI Extension
extension CoursesController {
	func designUi() {
		designViews(view: titleView)
		designViews(view: backButtonView)
		designViews(view: shadowCourseView)
		designLabels(view: titleViewLabel)
	}

	func setTitleLAbel() {
		if let faculty = selectedFaculty {
			titleViewLabel.text = faculty.name
		}
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
		courseController.selectedFaculty = self.selectedFaculty
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
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty))")
		if let newFaculty = selectedFaculty {
			if let newCourses = newAllCourses {
				for newCourse in newCourses {
					if newCourse.faculty == newFaculty.name {
						if timeFilterFacultyValues.isEmpty {
							if savedTimeFilterFacultyValues.isEmpty {
								filteredFacultyCourses.append(newCourse)
							}
							if savedTimeFilterFacultyValues.contains(time.day) {
								if newCourse.time == time.day {
									filteredFacultyCourses.append(newCourse)
								}
							}
							if savedTimeFilterFacultyValues.contains(time.evening) {
								if newCourse.time == time.evening {
									filteredFacultyCourses.append(newCourse)
								}
							}
						}
						if timeFilterFacultyValues.contains(time.day) {
							if newCourse.time == time.day {
								filteredFacultyCourses.append(newCourse)
							}
						}
						if timeFilterFacultyValues.contains(time.evening) {
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
