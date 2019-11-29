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

	//input data
	var course: Course?
	
	//input displayed processed output
	var signedInStudent: Student?
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** CourseOrder viewDidLoad  **************")
		debugPrint("student: \(String(describing: signedInStudent))")
		designView()

		let keyboardHide = UITapGestureRecognizer(target: self, action: #selector(keyboardWillHide))
		view.addGestureRecognizer(keyboardHide)

		fullNameTextField.delegate = self
		emailTextField.delegate = self
		phoneTextField.delegate = self
		commentsTextView.delegate = self

		setDefaultStudentValues()
    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {
			if let courseController = controllers[3] as? CourseController {
				navigationController?.popToViewController(courseController, animated: true)
			}
		}
	}

	@IBAction func didTapBuyButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {

			if let facultyController = controllers[1] as? FacultyController {
				navigationController?.popToViewController(facultyController, animated: true)
			}
		}
	}
	
	@IBAction func didTapConfirmPrivacyButton(_ sender: Any) {
		privacyValid = !privacyValid
		if !privacyValid {
			commentsTextView.text = "your comments ..."
			privacyImageView.image = UIImage(named: "checkBoxUnChecked")
		} else {
			commentsTextView.text = "post your funny comments about us on ... ebanoe.it !!!"
			privacyImageView.image = UIImage(named: "checkBoxChecked")
		}
	}
}

//MARK: - Extension

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

//MARK: - keyboardWillHide Extension
extension CourseOrderController {
	//hide keyboard
	@objc func keyboardWillHide() {
		self.view.endEditing(true)
		scrollViewSuperViewToSafeAreaBottomConstraint.constant = 20
		debugPrint("keyboardWillHide")
	}
}

//MARK: - UITextFieldDelegate Extension
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
			//validate EMAIL EMPTY or WITHOUT @
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

//MARK: - designView Extension
extension CourseOrderController {
	func designView() {

		// set the titleView shadow properties
		titleView.layer.shadowColor = UIColor.black.cgColor
		titleView.layer.shadowOffset = CGSize(width: 2, height: 2)
		titleView.layer.shadowOpacity = 1
		titleView.layer.shadowRadius = 25

		// set the titleView corner radius
		titleView.layer.cornerRadius = 7

		// set the shadowCollectionView shadow properties
		shadowScrollView.clipsToBounds = true
		shadowScrollView.layer.masksToBounds = false
		shadowScrollView.layer.shadowColor = UIColor.black.cgColor
		shadowScrollView.layer.shadowOffset = CGSize(width: 2, height: 2)
		shadowScrollView.layer.shadowOpacity = 1
		shadowScrollView.layer.shadowRadius = 25

		// set the round view for image

		// set the shadowCollectionView corner radius
		shadowScrollView.layer.cornerRadius = 7

		// set the filterButtonView shadow properties
		backButtonView.layer.shadowColor = UIColor.black.cgColor
		backButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		backButtonView.layer.shadowOpacity = 0.7
		backButtonView.layer.shadowRadius = 3

		fullNameTextField.layer.shadowColor = UIColor.black.cgColor
		fullNameTextField.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		fullNameTextField.layer.shadowOpacity = 0.9
		fullNameTextField.layer.shadowRadius = 3

		emailTextField.layer.shadowColor = UIColor.black.cgColor
		emailTextField.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		emailTextField.layer.shadowOpacity = 0.9
		emailTextField.layer.shadowRadius = 3

		phoneTextField.layer.shadowColor = UIColor.black.cgColor
		phoneTextField.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		phoneTextField.layer.shadowOpacity = 0.9
		phoneTextField.layer.shadowRadius = 3

		commentsView.clipsToBounds = true
		commentsView.layer.masksToBounds = false
		commentsView.layer.shadowColor = UIColor.black.cgColor
		commentsView.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		commentsView.layer.shadowOpacity = 0.9
		commentsView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		backButtonView.layer.cornerRadius = 7
		fullNameTextField.layer.cornerRadius = 7
		emailTextField.layer.cornerRadius = 7
		phoneTextField.layer.cornerRadius = 7
		commentsView.layer.cornerRadius = 7

		// set the filterButtonView shadow properties
		buyButtonView.layer.shadowColor = UIColor.black.cgColor
		buyButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		buyButtonView.layer.shadowOpacity = 0.7
		buyButtonView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		buyButtonView.layer.cornerRadius = 7

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
