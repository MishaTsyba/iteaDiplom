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

	//MARK: - Custom variables
	var signedInStudent: Student?
	var studentCurrentCourse: NewCourse?
	var studentLastCourses = [NewCourse]()
	var editMode = false

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		designUi()
		designEditibleTextFields(flag: editMode)
		textFieldInsetText()
		setSignedInStudentUiValues()
    }

	//MARK: - viewWillAppear

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
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let facultyController = controllers[1] as? FacultyController {
				navigationController?.popToViewController(facultyController, animated: false)
			}
		}
	}

	//MARK: - Edit Button Actions
	@IBAction func didTapEditButton(_ sender: Any) {
		editMode = !editMode
		setEditMode(flag: editMode)
		designEditibleTextFields(flag: editMode)
		if editMode {
			editButtonView.layer.backgroundColor = UIColor(red: 24/255, green: 53/255, blue: 94/255, alpha: 0.9).cgColor
			editButton.setTitle("Save", for: .normal)
		} else {
			editButtonView.layer.backgroundColor = UIColor(red: 20/255, green: 79/255, blue: 59/255, alpha: 0.9).cgColor
			editButton.setTitle("Edit", for: .normal)
		}
	}
	
	//MARK: - Last Courses Button Actions
	@IBAction func didTapLastCoursesButton(_ sender: Any) {
		debugPrint("didTapLastCoursesButton")
	}
}

//MARK: - set signedInStudent Ui Values Extension
extension StudentController {
	func setSignedInStudentUiValues() {

		ageLabel.text = "Age"
		cityLabel.text = "City"
		birthdayLabel.text = "Birthday"
		emailLabel.text = "Email"
		phoneLabel.text = "Phone"
		currentCourseLabel.text = "Current Course"
		workPlaceLabel.text = "Work Place"

		if let student = signedInStudent {
			firstNameTextField.text = student.firstName ?? "no info"
			lastNameTextField.text = student.lastName ?? "no info"
			ageTextField.text = student.age ?? "no info"
			cityTextField.text = student.city ?? "no info"
			birthdayTextField.text = student.birthday ?? "no info"
			emailTextField.text = student.email ?? "no info"
			phoneTextField.text = student.phone ?? "no info"
			currentCourseTextField.text = student.currentCourse ?? "no info"
			workPlaceTextField.text = student.workPlace ?? "no info"

			if let image = student.imageName {
				studentImageView.image = UIImage(named: image)
			}

			if let text = student.firstName {
				let buttonText = text + "'s Last Courses"
				studentLastCoursesButton.setTitle(buttonText, for: .normal)

				titleLabel.text = text + "'s Profile"
			}
		}
	}

	func setEditMode(flag: Bool) {
		firstNameTextField.isEnabled = flag
		lastNameTextField.isEnabled = flag
		ageTextField.isEnabled = flag
		cityTextField.isEnabled = flag
		birthdayTextField.isEnabled = flag
		phoneTextField.isEnabled = flag
		workPlaceTextField.isEnabled = flag
	}
}

//MARK: - Design UI Extension
extension StudentController {

	//MARK: - Design UI
	func designUi() {

		designViews(view: titleView)
		designViews(view: shadowScrollView)
		designViews(view: backButtonView)
		designViews(view: editButtonView)
		designViews(view: studentSignOutButtonView)
		designViews(view: studentLastCoursesButton)

		designIcons(view: studentPhotoView)
		designIcons(view: studentImageView)

		designLabels(view: titleLabel)
		designLabels(view: ageLabel)
		designLabels(view: emailLabel)
		designLabels(view: phoneLabel)
		designLabels(view: cityLabel)
		designLabels(view: birthdayLabel)
		designLabels(view: currentCourseLabel)
		designLabels(view: workPlaceLabel)
	}

	func designEditibleTextFields(flag: Bool) {

		if flag {
			setBackgroundTextField(view: firstNameTextField, flag: flag)
			setBackgroundTextField(view: lastNameTextField, flag: flag)
			setBackgroundTextField(view: ageTextField, flag: flag)
			setBackgroundTextField(view: cityTextField, flag: flag)
			setBackgroundTextField(view: birthdayTextField, flag: flag)
			setBackgroundTextField(view: phoneTextField, flag: flag)
			setBackgroundTextField(view: workPlaceTextField, flag: flag)
			designViews(view: firstNameTextField)
			designViews(view: lastNameTextField)
			designViews(view: ageTextField)
			designViews(view: cityTextField)
			designViews(view: birthdayTextField)
			designViews(view: phoneTextField)
			designViews(view: workPlaceTextField)
		} else {
			setBackgroundTextField(view: firstNameTextField, flag: flag)
			setBackgroundTextField(view: lastNameTextField, flag: flag)
			setBackgroundTextField(view: ageTextField, flag: flag)
			setBackgroundTextField(view: cityTextField, flag: flag)
			setBackgroundTextField(view: birthdayTextField, flag: flag)
			setBackgroundTextField(view: phoneTextField, flag: flag)
			setBackgroundTextField(view: workPlaceTextField, flag: flag)
			setDefaultTextFields(view: firstNameTextField)
			setDefaultTextFields(view: lastNameTextField)
			setDefaultTextFields(view: ageTextField)
			setDefaultTextFields(view: cityTextField)
			setDefaultTextFields(view: birthdayTextField)
			setDefaultTextFields(view: phoneTextField)
			setDefaultTextFields(view: workPlaceTextField)
		}
	}

	func setBackgroundTextField(view: UITextField, flag: Bool) {
		if flag {
			view.layer.backgroundColor = UIColor(red: 255/255, green: 234/255, blue: 167/255, alpha: 0.9).cgColor
		} else {
			view.layer.backgroundColor = UIColor.clear.cgColor
		}
	}

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

	//MARK: - Design textFields
	func designTextFields(view: UIView) {

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.4
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}

	//MARK: - default textFields
	func setDefaultTextFields(view: UIView) {

		//MARK: - set view shadow
		view.layer.shadowOffset = CGSize(width: 0, height: 0)
		view.layer.shadowOpacity = 0
		view.layer.shadowRadius = 0

		//MARK: - set view corner radius
		view.layer.cornerRadius = 0
	}
}

//MARK: - textField inset text Extension
extension StudentController {
	func textFieldInsetText() {

		firstNameTextField.setLeftPaddingPoints(10)
		lastNameTextField.setLeftPaddingPoints(10)
		ageTextField.setLeftPaddingPoints(10)
		cityTextField.setLeftPaddingPoints(10)
		birthdayTextField.setLeftPaddingPoints(10)
		emailTextField.setLeftPaddingPoints(10)
		phoneTextField.setLeftPaddingPoints(10)
		currentCourseTextField.setLeftPaddingPoints(10)
		workPlaceTextField.setLeftPaddingPoints(10)

		firstNameTextField.setRightPaddingPoints(10)
		lastNameTextField.setRightPaddingPoints(10)
		ageTextField.setRightPaddingPoints(10)
		cityTextField.setRightPaddingPoints(10)
		birthdayTextField.setRightPaddingPoints(10)
		emailTextField.setRightPaddingPoints(10)
		phoneTextField.setRightPaddingPoints(10)
		currentCourseTextField.setRightPaddingPoints(10)
		workPlaceTextField.setRightPaddingPoints(10)

	}
}
