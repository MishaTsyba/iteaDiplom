//
//  FacultyController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/25/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class FacultyController: UIViewController {

	//MARK: - Interface Outlets
	@IBOutlet weak var backgroundView: UIView!
	@IBOutlet weak var facultyCollectionView: UICollectionView!
	@IBOutlet weak var titleView: UIView!
	@IBOutlet weak var filterButton: UIButton!
	@IBOutlet weak var myProfileButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var shadowCollectionView: UIView!
	@IBOutlet weak var filterButtonView: UIView!
	@IBOutlet weak var profileButtonView: UIView!

	//MARK: - Custom variables
	var newAllCatehdrals = [NewCatehdral]()
	var newAllFaculties = [NewFaculty]()
	var newAllCourses = [NewCourse]()

	let name = Name()
	let time = Time()

	//input data
	var timeFilterFacultyValues = [String]()
	var typeFilterFacultyValues = [String]()
	var savedTimeFilterFacultyValues = [String]()
	var savedTypeFilterFacultyValues = [String]()

	//processing data

	//displayed data
	var filteredFaculties = [NewFaculty]()

	//output data
	var selectedFaculty: NewFaculty?

	//transfer data
	var signedInStudent: Student?
	var course: NewCourse?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** Faculty viewDidLoad  **************")
		debugPrint("student: \(String(describing: signedInStudent))")
		setDataModel()

		facultyCollectionView.register(UINib(nibName: "FacultyCell", bundle: nil), forCellWithReuseIdentifier: "FacultyCell")

		facultyCollectionView.delegate = self
		facultyCollectionView.dataSource = self

		designView()

		facultyCollectionView.reloadData()
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		debugPrint("*********** Faculty viewWillAppear  **************")
		filteredFaculties = []
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
		makeFilteredFaculties()
		facultyCollectionView.reloadData()
    }

	//MARK: - MyProfile Button Actions
	@IBAction func didTapMyProfileButton(_ sender: Any) {

		let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
		let studentController = studentStoryboard.instantiateViewController(withIdentifier: "StudentController") as! StudentController

		studentController.signedInStudent = self.signedInStudent
		studentController.newAllCourses = self.newAllCourses
		navigationController?.pushViewController(studentController, animated: true)
	}

	//MARK: - Filter Button Actions
	@IBAction func didTapFilterButton(_ sender: Any) {

		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let filterController = coursesStoryboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController

		filterController.newAllCatehdrals = self.newAllCatehdrals

		filterController.timeFilterFacultyValues = self.timeFilterFacultyValues
		filterController.typeFilterFacultyValues = self.typeFilterFacultyValues
		filterController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
		filterController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
		navigationController?.pushViewController(filterController, animated: true)
	}
}

//MARK: - CollectionView Delegate extension
extension FacultyController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if typeFilterFacultyValues.count == 0 {
			return newAllFaculties.count
		} else {
			return filteredFaculties.count
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacultyCell", for: indexPath) as! FacultyCell
		if typeFilterFacultyValues.count == 0 {
			cell.update(faculty: newAllFaculties[indexPath.row])
			return cell
		} else {
			cell.update(faculty: filteredFaculties[indexPath.row])
			return cell
		}
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let size = CGSize(width: collectionView.frame.width / 2 - 5, height: collectionView.frame.width / 1.8 - 5)

		return size
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		debugPrint("*********** Faculty didSelectItemAt  **************")

		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let coursesController = coursesStoryboard.instantiateViewController(withIdentifier: "CoursesController") as! CoursesController

		if typeFilterFacultyValues.count == 0 {
			coursesController.selectedFaculty = self.newAllFaculties[indexPath.row]
		} else {
			coursesController.selectedFaculty = self.filteredFaculties[indexPath.row]
		}

		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.name)))")
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.imageName))")
		coursesController.newAllCourses = self.newAllCourses
		debugPrint("allCourses: \(String(describing: self.newAllCourses))")
		coursesController.signedInStudent = self.signedInStudent
		debugPrint("signedInStudent: \(String(describing: self.signedInStudent))")
		coursesController.timeFilterFacultyValues = self.timeFilterFacultyValues
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		navigationController?.pushViewController(coursesController, animated: true)
	}
}

//MARK: - Make Filtered Faculties extension
extension FacultyController {

	func makeFilteredFaculties() {
		if typeFilterFacultyValues.contains(name.allTypes) {
			filteredFaculties = newAllFaculties
		} else {
			for faculty in newAllFaculties {
				if typeFilterFacultyValues.contains(faculty.cathedral) {
					filteredFaculties.append(faculty)
				}
			}
		}
		debugPrint("filteredFaculties: \(filteredFaculties.description)")
	}
}

extension FacultyController {
	func designView() {

		// set the titleView shadow properties
		titleView.layer.shadowColor = UIColor.black.cgColor
		titleView.layer.shadowOffset = CGSize(width: 2, height: 2)
		titleView.layer.shadowOpacity = 1
		titleView.layer.shadowRadius = 25

		// set the titleView corner radius
		titleView.layer.cornerRadius = 7

		// set the shadowCollectionView shadow properties
		shadowCollectionView.layer.shadowColor = UIColor.black.cgColor
		shadowCollectionView.layer.shadowOffset = CGSize(width: 2, height: 2)
		shadowCollectionView.layer.shadowOpacity = 1
		shadowCollectionView.layer.shadowRadius = 25

		// set the round view for image
		shadowCollectionView.clipsToBounds = true
		shadowCollectionView.layer.masksToBounds = false

		// set the shadowCollectionView corner radius
		shadowCollectionView.layer.cornerRadius = 7

		// set the filterButtonView shadow properties
		filterButtonView.layer.shadowColor = UIColor.black.cgColor
		filterButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		filterButtonView.layer.shadowOpacity = 0.7
		filterButtonView.layer.shadowRadius = 3

		// set the filterButtonView corner radius
		filterButtonView.layer.cornerRadius = 7

		// set the titleView shadow properties
		profileButtonView.layer.shadowColor = UIColor.black.cgColor
		profileButtonView.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
		profileButtonView.layer.shadowOpacity = 0.7
		profileButtonView.layer.shadowRadius = 3

		// set the titleView corner radius
		profileButtonView.layer.cornerRadius = 7
	}
}

