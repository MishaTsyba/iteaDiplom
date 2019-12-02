//
//  StudentController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class StudentController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var editButtonView: UIView!
	@IBOutlet weak var editButton: UIButton!

	@IBOutlet weak var nameView: UIView!
	@IBOutlet weak var studentPhotoView: UIView!
	@IBOutlet weak var studentImageView: UIImageView!
	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!

	@IBOutlet weak var shadowScrollView: UIView!
	@IBOutlet weak var mainContentView: UIView!
	@IBOutlet weak var ageLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var birthdayLabel: UILabel!
	@IBOutlet weak var emailLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var currentCourseLabel: UILabel!
	@IBOutlet weak var workPlaceLabel: UILabel!
	@IBOutlet weak var ageTextField: UITextField!
	@IBOutlet weak var cityTextField: UITextField!
	@IBOutlet weak var birthdayTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var phoneTextField: UITextField!
	@IBOutlet weak var currentCourseTextField: UITextField!
	@IBOutlet weak var workPlaceTextField: UITextField!

	@IBOutlet weak var studentSignOutButtonView: UIView!
	@IBOutlet weak var studentSignOutButton: UIButton!
	@IBOutlet weak var studentLastCoursesButton: UIButton!

	@IBOutlet weak var scrollViewSuperViewToSafeAreaBottomConstraint: NSLayoutConstraint!

	//MARK: - Custom variables
	var newAllCourses = [NewCourse]()
	var signedInStudent: Student?
	var studentCurrentCourses = [NewCourse]()
	var studentLastCourses = [NewCourse]()
	var editMode = false
	var selectedFaculty: NewFaculty?

	var firstNameFormatValid = false
	var lastNameFormatValid = false
	var cityFormatValid = false
	var birthdayFormatValid = false
	var workPlaceFormatValid = false
	var ageFormatValid = false
	var phoneFormatValid = false


	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

		debugPrint("*********** Student viewDidLoad  **************")
		debugPrint("studentCurrentCourses: \(studentCurrentCourses)")
		debugPrint("studentLastCourses: \(studentLastCourses)")

		designUi()
		designEditibleTextFields(flag: editMode)
		textFieldInsetText()
		setSignedInStudentUiValues()

		let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
		view.addGestureRecognizer(keyboardHide)

		firstNameTextField.delegate = self
		lastNameTextField.delegate = self
		ageTextField.delegate = self
		cityTextField.delegate = self
		birthdayTextField.delegate = self
		phoneTextField.delegate = self
		workPlaceTextField.delegate = self
    }
	
	//MARK: - Sign Out Button Actions
	@IBAction func didTapSignOutButton(_ sender: Any) {
		let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
		let signInController = authStoryboard.instantiateViewController(withIdentifier: "SignInController") as! SignInController

		self.signedInStudent = nil

		signInController.signedInStudent = self.signedInStudent
		navigationController?.pushViewController(signInController, animated: false)
	}

	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController

		facultyController.signedInStudent = self.signedInStudent
		facultyController.selectedFaculty = self.selectedFaculty
		facultyController.newAllCourses = self.newAllCourses
		navigationController?.pushViewController(facultyController, animated: false)
	}

	//MARK: - Edit Button Actions
	@IBAction func didTapEditButton(_ sender: Any) {
		editMode = !editMode
		setButtonEditMode(flag: editMode)
		setTextFieldEditMode(flag: editMode)
		designEditibleTextFields(flag: editMode)

		if !editMode {
			keyboardWillHide()
		}
	}
	
	//MARK: - Last Courses Button Actions
	@IBAction func didTapLastCoursesButton(_ sender: Any) {
		let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
		let studentCoursesController = studentStoryboard.instantiateViewController(withIdentifier: "StudentCoursesController") as! StudentCoursesController
		studentCoursesController.newAllCourses = self.newAllCourses
		studentCoursesController.signedInStudent = self.signedInStudent
		studentCoursesController.studentCurrentCourses = self.studentCurrentCourses
		studentCoursesController.studentLastCourses = self.studentLastCourses
		studentCoursesController.selectedFaculty = self.selectedFaculty
		debugPrint("studentCurrentCourses: \(studentCurrentCourses)")
		debugPrint("studentLastCourses: \(studentLastCourses)")
		navigationController?.pushViewController(studentCoursesController, animated: false)
	}
}
