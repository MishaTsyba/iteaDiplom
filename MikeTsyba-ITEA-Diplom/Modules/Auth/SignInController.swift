//
//  SignInController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class SignInController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!

	@IBOutlet weak var signInContentView: UIView!

	@IBOutlet weak var logoView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var sloganLabel: UILabel!
	@IBOutlet weak var logoPhotoView: UIView!
	@IBOutlet weak var logoImageView: UIImageView!

	@IBOutlet weak var signInView: UIView!
	@IBOutlet weak var signInLabel: UILabel!
	@IBOutlet weak var emailView: UIView!
	@IBOutlet weak var emailPhotoView: UIView!
	@IBOutlet weak var emailImageView: UIImageView!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordView: UIView!
	@IBOutlet weak var passwordPhotoView: UIView!
	@IBOutlet weak var passwordImageView: UIImageView!
	@IBOutlet weak var passwordTextField: UITextField!

	@IBOutlet weak var signInButtonView: UIView!
	@IBOutlet weak var signInButton: UIButton!
	@IBOutlet weak var scrollViewToSafeAreaBottomConstraint: NSLayoutConstraint!
	

	//MARK: - Custom variables
	var emailFormatValid = false
	var passwordFormatValid = false
	var errorEmailFormatMessage = String()
	var errorPasswordFormatMessage = String()
	var userEmailValid = false
	var userPasswordValid = false

	//input data

	//output data
	var signedInStudent: Student?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		designView()
		makeStudent()

		let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
		view.addGestureRecognizer(keyboardHide)

		emailTextField.delegate = self
		passwordTextField.delegate = self
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)

		//set all VALIDATION values to initial state
		emailTextField.text = ""
		passwordTextField.text = ""

		userEmailValid = false
		userPasswordValid = false
	}
	//MARK: - Button Actions

	@IBAction func didTapSignInButton(_ sender: Any) {
		validateUserInfo()
		if userEmailValid && userPasswordValid {

			let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
			let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController

			facultyController.signedInStudent = self.signedInStudent
			navigationController?.pushViewController(facultyController, animated: true)
		}
	}
}

//MARK: - keyboardWillHide Extension
extension SignInController {
	//hide keyboard
	@objc func keyboardWillHide() {
		self.view.endEditing(true)
		scrollViewToSafeAreaBottomConstraint.constant = 0
		debugPrint("keyboardWillHide")
	}
}

//MARK: - UITextFieldDelegate Extension
extension SignInController: UITextFieldDelegate {

	//lift up ScrollView
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		scrollViewToSafeAreaBottomConstraint.constant = 280
		debugPrint("ShouldBeginEditing")
		return true
	}

	//validate user data FORMAT input
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

		debugPrint("ShouldEndEditing")
		switch textField {
		case emailTextField:
			validateEmailFormat()
		default:
			validatePasswordFormat()
		}
		return true
	}

	//go to NEXT TextField
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {

		debugPrint("ShouldReturn")
		switch textField {
		case emailTextField:
			passwordTextField.becomeFirstResponder()
		default:
			passwordTextField.resignFirstResponder()
			scrollViewToSafeAreaBottomConstraint.constant = 0
		}
		return true
	}
}

//MARK: - make Alert extension
extension SignInController {
	func validationAlert(title: String, message: String, actionTitle: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

		let actionTryAgain = UIAlertAction(title: actionTitle, style: .default)

		let cancelCancel = UIAlertAction(title: "Cancel", style: .cancel)

		alertController.addAction(actionTryAgain)
		alertController.addAction(cancelCancel)

		present(alertController, animated: true, completion: nil)
	}
}

//MARK: - Validate Input Format AND Data Extension
extension SignInController {

	//validate EMAIL FORMAT
	func validateEmailFormat() {
		if let enteredEmailValue = emailTextField.text {
			//validate EMAIL EMPTY or WITHOUT @
			if enteredEmailValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter your Account Email", actionTitle: "Try Again")
			} else if !enteredEmailValue.contains("@") {
				validationAlert(title: "Error", message: "Please enter valid email address with @", actionTitle: "Try Again")
			} else {
				emailFormatValid = true
			}
		}
	}

	//validate PASSWORD FORMAT
	func validatePasswordFormat() {
		if let enteredPasswordValue = passwordTextField.text {
			//validate 6 < PASSWORD < 15 or EMPTY
			if enteredPasswordValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter your Account Password", actionTitle: "Try Again")
			} else if enteredPasswordValue.count < 1 || enteredPasswordValue.count > 15 {
				validationAlert(title: "Error", message: "Please enter valid password 1 - 15 characters", actionTitle: "Try Again")
			} else {
				passwordFormatValid = true
			}
		}
	}

	//validate User Input Data
	func validateUserInfo() {
		debugPrint("******* validateUserInfo ********")
		if let student = signedInStudent {
			if student.email == emailTextField.text {
				debugPrint("VALIDATE userEmail OK")
				userEmailValid = true
				if student.password == passwordTextField.text {
					debugPrint("VALIDATE userPassword OK")
					userPasswordValid = true
				} else {
					userPasswordValid = false
					validationAlert(title: "Error", message: "Please enter correct Account Password", actionTitle: "Try Again")
					debugPrint("VALIDATE userPassword NO")
				}
			} else {
				debugPrint("VALIDATE userEmail NO")
				userEmailValid = false
				validationAlert(title: "Error", message: "Please enter correct Account Email", actionTitle: "Try Again")
			}
		}
	}
}

//MARK: - Make Student extension
extension SignInController {
	func makeStudent() {
		signedInStudent = Student(firstName: "Mike", lastName: "Tsyba", age: "41", city: "Kiev", birthday: "09-04-1978", phone: "+380503387901", workPlace: "Home Office", email: "@", password: "q", currentCourse: "iOS Basic", completedCourses: ["Basic Programming", "JS Basic", "HTML/CSS"])
	}
}

//MARK: - Design Views Extension
extension SignInController {
	func designView() {

		// set the titleView shadow properties
		logoView.layer.shadowColor = UIColor.black.cgColor
		logoView.layer.shadowOffset = CGSize(width: 2, height: 2)
		logoView.layer.shadowOpacity = 1
		logoView.layer.shadowRadius = 25

		// set the titleView corner radius
		logoView.layer.cornerRadius = 7

		// set the shadowCollectionView shadow properties
		signInView.layer.shadowColor = UIColor.black.cgColor
		signInView.layer.shadowOffset = CGSize(width: 2, height: 2)
		signInView.layer.shadowOpacity = 1
		signInView.layer.shadowRadius = 25

		// set the round view for image
		signInView.clipsToBounds = true
		signInView.layer.masksToBounds = false

		// set the shadowCollectionView corner radius
		signInView.layer.cornerRadius = 7

		// set the titleView shadow properties
		signInButtonView.layer.shadowColor = UIColor.black.cgColor
		signInButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		signInButtonView.layer.shadowOpacity = 0.7
		signInButtonView.layer.shadowRadius = 3

		// set the titleView corner radius
		signInButtonView.layer.cornerRadius = 7
	}
}
