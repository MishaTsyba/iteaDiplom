//
//  CourseOrderController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - set default Student values Extension
extension CourseOrderController {
	func setDefaultStudentValues() {
		if let student = signedInStudent {
			if let studentFirstName = student.firstName, let studentLastName = student.lastName, let studentEmail = student.email, let studentPhone = student.phone {
				fullNameTextField.text = studentFirstName + " " + studentLastName
				emailTextField.text = studentEmail
				phoneTextField.text = studentPhone
				commentsTextView.text = "your comments ..."
			}
		}
	}
}

//MARK: - design UI
extension CourseOrderController {
	func designUi() {
		designViews(view: titleView)
		designViews(view: backButtonView)
		designViews(view: shadowScrollView)
		designViews(view: emailTextField)
		designViews(view: fullNameTextField)
		designViews(view: phoneTextField)
		designViews(view: commentsView)
		designViews(view: buyButtonView)
		designLabels(view: titleLabel)
		designLabels(view: fullNameLabel)
		designLabels(view: emailLabel)
		designLabels(view: phoneLabel)
		designLabels(view: commentLabel)
		designLabels(view: privacyLabel)
		textFieldInsetText()
		privacyImageView.image = UIImage(named: name.privacyOff)
	}

	func setTitleLabel() {
		if let item = course {
			let motto = "Take " + item.name + "!"
			titleLabel.text = motto
			buyButton.setTitle(motto, for: .normal)
		}
	}
}

//MARK: - keyboardWillHide Extension
extension CourseOrderController {
	//hide keyboard
	@objc func keyboardWillHide() {
		self.view.endEditing(true)
		scrollViewSuperViewToSafeAreaBottomConstraint.constant = 20
		debugPrint("keyboardWillHide")
	}
}

//MARK: - UITextViewDelegate Extension
extension CourseOrderController: UITextViewDelegate {
	func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
		scrollViewSuperViewToSafeAreaBottomConstraint.constant = 280
		debugPrint("textView ShouldBeginEditing")
		textView.text = ""
		return true
	}
}

//MARK: - UITextFieldDelegate Extension
extension CourseOrderController: UITextFieldDelegate {

	//lift up ScrollView
	func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
		scrollViewSuperViewToSafeAreaBottomConstraint.constant = 280
		debugPrint("ShouldBeginEditing")
		textField.text = ""
		return true
	}

	//validate user data FORMAT input
	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {

		debugPrint("ShouldEndEditing")
		switch textField {
		case fullNameTextField:
			validateFullNameFormat()
		case emailTextField:
			validateEmailFormat()
		default:
			validatePhoneFormat()
		}
		return true
	}

	//go to NEXT TextField
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {

		debugPrint("ShouldReturn")
		switch textField {
		case fullNameTextField:
			emailTextField.becomeFirstResponder()
		case emailTextField:
			phoneTextField.becomeFirstResponder()
		case phoneTextField:
			phoneTextField.resignFirstResponder()
			scrollViewSuperViewToSafeAreaBottomConstraint.constant = 20
		default:
			debugPrint("scroll view down")
		}
		return true
	}
}

//MARK: - Validate Input Format AND Data Extension
extension CourseOrderController {

	//validate Full Name FORMAT
	func validateFullNameFormat() {
		if let enteredFullNameValue = fullNameTextField.text {
			//validate EMAIL EMPTY or < 2
			if enteredFullNameValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter your Full Name", actionTitle: "Try Again")
			} else if enteredFullNameValue.count < 2 {
				validationAlert(title: "Error", message: "Please enter your Full Name at least 2 characters", actionTitle: "Try Again")
			} else {
				emailFormatValid = true
			}
		}
	}

	//validate EMAIL FORMAT
	func validateEmailFormat() {
		if let enteredEmailValue = emailTextField.text {
			//validate EMAIL EMPTY or WITHOUT @
			if enteredEmailValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter your Email", actionTitle: "Try Again")
			} else if !enteredEmailValue.contains("@") {
				validationAlert(title: "Error", message: "Please enter valid email address with @", actionTitle: "Try Again")
			} else {
				emailFormatValid = true
			}
		}
	}

	//validate Phone FORMAT
	func validatePhoneFormat() {
		if let enteredPhoneValue = phoneTextField.text {
			//validate EMAIL EMPTY or WITHOUT @
			if enteredPhoneValue.isEmpty {
				validationAlert(title: "Error", message: "Please enter your Phone Number", actionTitle: "Try Again")
			} else if !enteredPhoneValue.contains("+") {
				validationAlert(title: "Error", message: "Please enter valid Phone Number address with +", actionTitle: "Try Again")
			} else {
				emailFormatValid = true
			}
		}
	}
}

//MARK: - make Alert extension
extension CourseOrderController {
	func validationAlert(title: String, message: String, actionTitle: String) {
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

		let actionTryAgain = UIAlertAction(title: actionTitle, style: .default)

		let cancelCancel = UIAlertAction(title: "Cancel", style: .cancel)

		alertController.addAction(actionTryAgain)
		alertController.addAction(cancelCancel)

		present(alertController, animated: true, completion: nil)
	}
}

//MARK: - Design UI Extension
extension CourseOrderController {

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

	//MARK: - Design textFields
	func designtextFields(view: UIView) {

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.4
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}
}

//MARK: - textField inset text Extension
extension CourseOrderController {
	func textFieldInsetText() {

		fullNameTextField.setLeftPaddingPoints(10)
		fullNameTextField.setRightPaddingPoints(10)
		emailTextField.setLeftPaddingPoints(10)
		emailTextField.setRightPaddingPoints(10)
		phoneTextField.setLeftPaddingPoints(10)
		phoneTextField.setRightPaddingPoints(10)
	}
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
