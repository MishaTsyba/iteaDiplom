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
	var studentCurrentCourses = [NewCourse]()
	var studentLastCourses = [NewCourse]()

	let name = Name()
	let time = Time()

	//input data
	var timeFilterFacultyValues = [String]()
	var typeFilterFacultyValues = [String]()
	var savedTimeFilterFacultyValues = [String]()
	var savedTypeFilterFacultyValues = [String]()

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
		designUi()
		facultyCollectionView.register(UINib(nibName: "FacultyCell", bundle: nil), forCellWithReuseIdentifier: "FacultyCell")

		facultyCollectionView.delegate = self
		facultyCollectionView.dataSource = self

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

	//MARK: - Profile Button Actions
	@IBAction func didTapMyProfileButton(_ sender: Any) {

		makeStudentCorses(signedInStudent: signedInStudent, courses: newAllCourses)

		let studentStoryboard = UIStoryboard(name: "Student", bundle: nil)
		let studentController = studentStoryboard.instantiateViewController(withIdentifier: "StudentController") as! StudentController

		studentController.signedInStudent = self.signedInStudent
		studentController.studentCurrentCourses = self.studentCurrentCourses
		studentController.studentLastCourses = self.studentLastCourses
		studentController.selectedFaculty = self.selectedFaculty
		studentController.newAllCourses = self.newAllCourses
		navigationController?.pushViewController(studentController, animated: false)
	}

	//MARK: - Filter Button Actions
	@IBAction func didTapFilterButton(_ sender: Any) {

		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let filterController = coursesStoryboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController

		filterController.newAllCourses = self.newAllCourses
		filterController.newAllCatehdrals = self.newAllCatehdrals
		filterController.signedInStudent = self.signedInStudent
		filterController.timeFilterFacultyValues = self.timeFilterFacultyValues
		filterController.typeFilterFacultyValues = self.typeFilterFacultyValues
		filterController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
		filterController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
		navigationController?.pushViewController(filterController, animated: false)
	}
}
