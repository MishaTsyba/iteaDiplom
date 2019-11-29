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


	//MARK: - Custom variables

	//input data

	//output data
	var signedInStudent: Student?

	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		designView()
    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions

	@IBAction func didTapSignInButton(_ sender: Any) {
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController

		facultyController.signedInStudent = self.signedInStudent
		navigationController?.pushViewController(facultyController, animated: true)
	}

}

//MARK: - Make Student extension
extension SignInController {

	func makeStudent() {
		signedInStudent = Student(firstName: "Mike", lastName: "Tsyba", age: "41", city: "Kiev", birthday: "09-04-1978", phone: "+380503387901", workPlace: "Home Office", email: "@", password: "m", currentCourse: "iOS Basic", completedCourses: ["Basic Programming", "JS basic", "HTML/CSS"])
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
