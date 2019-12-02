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
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var innerContentView: UIView!
	@IBOutlet weak var fullNameLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var commentLabel: UILabel!
	@IBOutlet weak var fullNameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var commentsView: UIView!
	@IBOutlet weak var commentsTextView: UITextView!
	@IBOutlet weak var buyButtonView: UIView!
	@IBOutlet weak var buyButton: UIButton!
	@IBOutlet weak var privacyView: UIView!
	@IBOutlet weak var privacyImageView: UIImageView!
	@IBOutlet weak var privacyLabel: UILabel!
	@IBOutlet weak var privacyButton: UIButton!
	@IBOutlet weak var scrollViewSuperViewToSafeAreaBottomConstraint: NSLayoutConstraint!

	//MARK: - Custom variables
	var privacyValid = false
	var fullNameFormatValid = false
	var emailFormatValid = false
	var phoneFormatValid = false
	let name = Name()

	//input data
	var course: NewCourse?
	
	//input displayed processed output
	var signedInStudent: Student?
	var selectedFaculty: NewFaculty?
	var filteredFacultyCourses = [NewCourse]()
	var newAllCourses = [NewCourse]()
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** CourseOrder viewDidLoad  **************")

		designUi()
		setTitleLabel()

		debugPrint("student: \(String(describing: signedInStudent))")

		let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
		view.addGestureRecognizer(keyboardHide)

		fullNameTextField.delegate = self
		emailTextField.delegate = self
		phoneTextField.delegate = self
		commentsTextView.delegate = self

		setDefaultStudentValues()
    }

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

	//MARK: - Buy Button Actions
	@IBAction func didTapBuyButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		if privacyValid {
			let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
			let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController
			facultyController.signedInStudent = self.signedInStudent
			navigationController?.pushViewController(facultyController, animated: false)
		} else {
			validationAlert(title: "Wanna Be R' Student ???", message: "You must conform to PPP - our nice Privacy Policy Protocol !!!", actionTitle: "Force Unwrap Now!")
		}
	}

	//MARK: - Privacy Button Actions
	@IBAction func didTapConfirmPrivacyButton(_ sender: Any) {
		privacyValid = !privacyValid
		if !privacyValid {
			commentsTextView.text = "your comments ..."
			privacyImageView.image = UIImage(named: name.privacyOff)
		} else {
			commentsTextView.text = "You can post your comments now  ... on ebanoe.it !!!"
			privacyImageView.image = UIImage(named: name.privacyOn)
		}
	}
}

