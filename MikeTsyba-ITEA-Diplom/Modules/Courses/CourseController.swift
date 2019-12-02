//
//  CourseController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CourseController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var buyButtonView: UIView!
	@IBOutlet weak var buyButton: UIButton!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var textContentView: UIView!

	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var skillsLabel: UILabel!
	@IBOutlet weak var moreInfoButton: UIButton!

	//MARK: - Custom variables
	var filteredFacultyCourses = [NewCourse]()
	
	//transfer data
	var course: NewCourse?
	var signedInStudent: Student?
	var selectedFaculty: NewFaculty?
	var fromLastCourses = false
	var newAllCourses = [NewCourse]()
	
	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** Course viewDidLoad  **************")
		debugPrint("filteredFacultyCourses: \(filteredFacultyCourses))")
		designViews(view: titleView)
		designViews(view: buyButtonView)
		designViews(view: backButtonView)
		designViews(view: shadowScrollView)
		designViews(view: moreInfoButton)
		designLabels(view: titleLabel)
		designLabels(view: descriptionLabel)
		designLabels(view: skillsLabel)

		debugPrint("student: \(String(describing: signedInStudent))")
		debugPrint("fromLastCourses: \(fromLastCourses))")

		if let item = course {
			titleLabel.text = item.name
			descriptionLabel.text = item.description
			skillsLabel.text = item.skills
		}
    }

	//MARK: - viewWillAppear

	//MARK: - MoreInfo Button Actions
	@IBAction func didTapMoreInfoButton(_ sender: Any) {
		fromLastCourses = false
		debugPrint("*********** tap info  **************")
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseDetailsController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseDetailesController") as! CourseDetailesController
		courseDetailsController.newAllCourses = self.newAllCourses

		courseDetailsController.course = self.course
		courseDetailsController.signedInStudent = self.signedInStudent
		courseDetailsController.selectedFaculty = self.selectedFaculty
		courseDetailsController.filteredFacultyCourses = self.filteredFacultyCourses
		debugPrint("course: \(String(describing: course))")
		navigationController?.pushViewController(courseDetailsController, animated: false)
	}

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		debugPrint("*********** fromLastCourses \(fromLastCourses)  **************")

			let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
			let coursesController = coursesStoryboard.instantiateViewController(withIdentifier: "CoursesController") as! CoursesController

			coursesController.signedInStudent = self.signedInStudent
			coursesController.course = self.course
			coursesController.selectedFaculty = self.selectedFaculty
			coursesController.filteredFacultyCourses = self.filteredFacultyCourses
			coursesController.newAllCourses = self.newAllCourses

			debugPrint("signedInStudent: \(String(describing: signedInStudent))")
			debugPrint("course: \(String(describing: course))")
			debugPrint("selectedFaculty: \(String(describing: selectedFaculty))")

			navigationController?.pushViewController(coursesController, animated: false)
	}

	//MARK: - Buy Button Actions
	@IBAction func didTapBuyButton(_ sender: Any) {
		debugPrint("*********** tap order  **************")
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let courseOrderController = coursesStoryboard.instantiateViewController(withIdentifier: "CourseOrderController") as! CourseOrderController

		courseOrderController.signedInStudent = self.signedInStudent
		courseOrderController.course = self.course
		courseOrderController.selectedFaculty = self.selectedFaculty
		courseOrderController.filteredFacultyCourses = self.filteredFacultyCourses
		courseOrderController.newAllCourses = self.newAllCourses

		debugPrint("signedInStudent: \(String(describing: signedInStudent))")
		debugPrint("course: \(String(describing: course))")
		navigationController?.pushViewController(courseOrderController, animated: false)
	}
}

//MARK: - Design UI Extension
extension CourseController {

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
