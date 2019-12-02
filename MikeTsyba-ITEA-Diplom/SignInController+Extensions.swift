//
//  SignInController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - Design Controller UI Delegate extension
extension SignInController {
	func designUi() {
		designViews(view: logoView)
		designViews(view: signInView)
		designViews(view: emailView)
		designViews(view: passwordView)
		designViews(view: signInButtonView)
		designLabels(view: titleLabel)
		designIcons(view: logoImageView)
		designIcons(view: emailImageView)
		designIcons(view: passwordImageView)
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

	//MARK: - validate user data FORMAT input
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

	//MARK: - go to NEXT TextField
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

	//MARK: - validate EMAIL FORMAT
	func validateEmailFormat() {
		if let enteredEmailValue = emailTextField.text {
			//validate EMAIL EMPTY or WITHOUT @
			if enteredEmailValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter Account Email", actionTitle: "Try Again")
			} else if !enteredEmailValue.contains("@") {
				validationAlert(title: "Error", message: "Please enter valid Account Email with @", actionTitle: "Try Again")
			} else {
				emailFormatValid = true
			}
		}
	}

	//MARK: - validate PASSWORD FORMAT
	func validatePasswordFormat() {
		if let enteredPasswordValue = passwordTextField.text {
			//validate 6 < PASSWORD < 15 or EMPTY
			if enteredPasswordValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter Account Password", actionTitle: "Try Again")
			} else if enteredPasswordValue.count < 1 || enteredPasswordValue.count > 15 {
				validationAlert(title: "Error", message: "Please enter valid Account Password 1 - 15 characters", actionTitle: "Try Again")
			} else {
				passwordFormatValid = true
			}
		}
	}

	//MARK: - validate User Input Data
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

	//MARK: - makeStudent
	func makeStudent() {
		signedInStudent = Student(firstName: "Mike", lastName: "Tsyba", age: "41", city: "Kiev", birthday: "09-04-1978", phone: "+380503387901", workPlace: "Home Office", email: "@", password: "q", imageName: "mike", currentCourses: [name.iosBasic, name.iosAdvanced], lastCourses: [name.progBasic, name.jsBasic, name.htmlCss])
	}
}

//MARK: - Design UI Extension
extension SignInController {

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
