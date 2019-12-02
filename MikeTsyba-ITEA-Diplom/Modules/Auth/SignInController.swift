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

	let name = Name()

	//output data
	var signedInStudent: Student?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		makeStudent()
		designUi()

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

	//MARK: - Button Sign In Actions
	@IBAction func didTapSignInButton(_ sender: Any) {
		validateUserInfo()
		if userEmailValid && userPasswordValid {

			let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
			let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController

			facultyController.signedInStudent = self.signedInStudent
			navigationController?.pushViewController(facultyController, animated: false)
		}
	}
}

