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
		studentCurrentCourses = []
		studentLastCourses = []
		studentAllCourses = []
		navigationController?.pushViewController(studentController, animated: false)
	}
}

//MARK: - TableView Delegate Extension
extension StudentCoursesController: UITableViewDelegate, UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		debugPrint("***** numberOfSections studentAllCourses.count: \(studentAllCourses.count)")
		return studentAllCourses.count
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let headerView = UIView(frame: CGRect(x: 10, y: 10, width: tableView.frame.width / 2, height: 40))
		headerView.layer.backgroundColor = UIColor.clear.cgColor

		let headerLabel = UILabel(frame: headerView.frame)
		headerLabel.font = UIFont(name:"AvenirNext-DemiBold", size: 18.0)
		headerLabel.textAlignment = .left
		headerLabel.layer.backgroundColor = UIColor(red: 255/255, green: 240/255, blue: 210/255, alpha: 0.9).cgColor

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

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 60
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
