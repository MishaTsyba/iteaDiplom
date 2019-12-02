//
//  StudentCoursesController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - Design Controller UI Delegate extension
extension StudentCoursesController {
	func designUi() {
		designViews(view: titleView)
		designViews(view: backButtonView)
		designViews(view: shadowCourseView)
		designLabels(view: titleViewLabel)
	}
}

//MARK: - TableView Delegate Extension
extension StudentCoursesController: UITableViewDelegate, UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		debugPrint("***** numberOfSections studentAllCourses.count: \(studentAllCourses.count)")
		return studentAllCourses.count
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let headerView = UIView(frame: CGRect(x: 5, y: 5, width: tableView.frame.width / 2.5, height: 40))
		headerView.layer.backgroundColor = UIColor.clear.cgColor

		let headerLabel = UILabel(frame: headerView.frame)
		headerLabel.font = UIFont(name:"AvenirNext-DemiBold", size: 18.0)
		headerLabel.textAlignment = .left
		headerLabel.textColor = .white
		headerLabel.layer.backgroundColor = UIColor(red: 25/255, green: 100/255, blue: 65/255, alpha: 0.8).cgColor

		// set the shadow properties
		headerLabel.layer.shadowColor = UIColor.black.cgColor
		headerLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
		headerLabel.layer.shadowOpacity = 1
		headerLabel.layer.shadowRadius = 4

		// set the corner radius
		headerLabel.layer.cornerRadius = 7

		switch section {
		case 0:
			if studentAllCourses.count > 1 {
				headerLabel.text = " Current"
			} else {
				headerLabel.text = " Completed"
			}
		default:
			headerLabel.text = "  Completed"
		}

		headerView.addSubview(headerLabel)

		return headerView
	}

	func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

		let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 20))
		footerView.layer.backgroundColor = UIColor.clear.cgColor

		return footerView
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60
	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
		return 20
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		debugPrint("***** numberOfRowsInSection studentAllCourses[section].count: \(studentAllCourses[section].count)")
		return studentAllCourses[section].count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "CourseCell", for: indexPath) as! CourseCell
		cell.update(course: studentAllCourses[indexPath.section][indexPath.row])
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
		courseController.newAllCourses = self.newAllCourses
		courseController.studentLastCourses = self.studentLastCourses
		courseController.studentCurrentCourses = self.studentCurrentCourses
		courseController.selectedFaculty = self.selectedFaculty
		debugPrint("selectedFaculty: \(String(describing: courseController.selectedFaculty))")
		courseController.fromLastCourses = true
		courseController.course = studentAllCourses[indexPath.section][indexPath.row]
		courseController.signedInStudent = self.signedInStudent
		debugPrint("course: \(studentAllCourses[indexPath.section][indexPath.row])")
		debugPrint("signedInStudent: \(String(describing: signedInStudent))")
		debugPrint("studentAllCourses.count: \(String(describing: studentAllCourses.count))")

		studentCurrentCourses = []
		studentLastCourses = []
		studentAllCourses = []
		navigationController?.pushViewController(courseController, animated: false)
	}
}

//MARK: - Make table View Sections Data extension
extension StudentCoursesController {
	func makeTableViewSectionsData() {
		if studentCurrentCourses.isEmpty && studentLastCourses.isEmpty {
			noCoursesAlert()
		}

		if !studentCurrentCourses.isEmpty {
			studentAllCourses.append(studentCurrentCourses)
		}

		if !studentLastCourses.isEmpty {
			studentAllCourses.append(studentLastCourses)
		}
	}
}

//MARK: - Alert extension
extension StudentCoursesController {
	func noCoursesAlert() {
		let alertController = UIAlertController(title: "Sorry", message: "No available Courses this time", preferredStyle: .alert)

		let actionFirst = UIAlertAction(title: "Return", style: .default)

		let cancelFirst = UIAlertAction(title: "Cancel", style: .cancel)

		alertController.addAction(actionFirst)
		alertController.addAction(cancelFirst)

		present(alertController, animated: true, completion: nil)
	}
}

//MARK: - Set Title label Extension
extension StudentCoursesController {
	func setTitleLabel() {
		if let student = signedInStudent {
			if let text = student.firstName {
				titleViewLabel.text = text + "'s Last Courses"
			}
		}
	}
}

//MARK: - Design UI Extension
extension StudentCoursesController {

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
