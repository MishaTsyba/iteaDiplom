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
	//input data
	var timeFilterFacultyValues = [String]()
	var typeFilterFacultyValues = [String]()
	var savedTimeFilterFacultyValues = [String]()
	var savedTypeFilterFacultyValues = [String]()

	//processing data
	var allCathedrals = [Catehdral]()
	var allFaculties = [Faculty]()

	//displayed data
	var filteredFaculties = [Faculty]()

	//output data
	var selectedFaculty: Faculty?
	var allCourses: [Course]?
	//var filterCathedralNames = [String]()

	//transfer data
	var signedInStudent: Student?

	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** filter viewDidLoad  **************")
		makeStudent()
		makeAllCourses()
		makeAllFaculties()
		makeAllCathedrals()

		facultyCollectionView.register(UINib(nibName: "FacultyCell", bundle: nil), forCellWithReuseIdentifier: "FacultyCell")

		facultyCollectionView.delegate = self
		facultyCollectionView.dataSource = self

		designView()

		facultyCollectionView.reloadData()
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		debugPrint("*********** filter viewWillAppear  **************")
		filteredFaculties = []
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")

		if typeFilterFacultyValues.contains("All Types") {
			filteredFaculties = allFaculties
		} else {
			for faculty in allFaculties {
				if let cathedral = faculty.cathedral {
					if typeFilterFacultyValues.contains(cathedral) {
						filteredFaculties.append(faculty)
					}
				}
			}
		}

		debugPrint("filteredFaculties: \(filteredFaculties.description)")
		facultyCollectionView.reloadData()
    }

	//MARK: - MyProfile Button Actions
	@IBAction func didTapMyProfileButton(_ sender: Any) {
	}

	//MARK: - Filter Button Actions
	
	@IBAction func didTapFilterButton(_ sender: Any) {

		//makeFilterCathedralNames(allCathedrals: self.allCathedrals)
		
		//debugPrint("filterCathedralNames: \(filterCathedralNames)")

		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let filterController = coursesStoryboard.instantiateViewController(withIdentifier: "FilterController") as! FilterController
		
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
			return allFaculties.count
		} else {
			return filteredFaculties.count
		}
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FacultyCell", for: indexPath) as! FacultyCell
		if typeFilterFacultyValues.count == 0 {
			cell.update(faculty: allFaculties[indexPath.row])
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
}

//MARK: - Make Cathedrals extension
extension FacultyController {

	func makeAllCathedrals() {
		let mobDev = Catehdral(name: "Mobile Development")
		let feDev = Catehdral(name: "Front End Development")
		let design = Catehdral(name: "Design")
		let qa = Catehdral(name: "QA")
		let other = Catehdral(name: "Other")
		let programming = Catehdral(name: "Programming")

		allCathedrals = [programming, mobDev, feDev, design, qa, other]
	}
}

//MARK: - Make Faculties extension
extension FacultyController {

	func makeFilteredFaculties(filterValues: [Bool], faculties: [Faculty]) {

	}

	func makeAllFaculties() {
		let iosFaculty = Faculty(name: "iOS", cathedral: "Mobile Development", imageName: "iOScountur")
		let andrFaculty = Faculty(name: "Android", cathedral: "Mobile Development", imageName: "androidCountur")
		let reactFaculty = Faculty(name: "React", cathedral: "Mobile Development", imageName: "reactCountur")
		let feFaculty = Faculty(name: "Front End", cathedral: "Front End Development", imageName: "feCountur")
		let jsFaculty = Faculty(name: "JS", cathedral: "Front End Development", imageName: "jsCountur")
		let wdFaculty = Faculty(name: "Web Design", cathedral: "Design", imageName: "wdCountur")
		let testsFaculty = Faculty(name: "Testing", cathedral: "QA", imageName: "testsCountur")
		let dmFaculty = Faculty(name: "Digital Marketing", cathedral: "Other", imageName: "dmCountur")
		let pmFaculty = Faculty(name: "Project Management", cathedral: "Other", imageName: "pmCountur")
		let progrFaculty = Faculty(name: "Programming", cathedral: "Programming", imageName: "progCountur")

		allFaculties = [iosFaculty, andrFaculty, reactFaculty, feFaculty, jsFaculty, wdFaculty, testsFaculty, dmFaculty, pmFaculty, progrFaculty]
	}
}

//MARK: - Make Courses extension
extension FacultyController {

	func makeAllCourses() {
		let iosBasicCourse = Course(name: "iOS Basic", faculty: "iOS", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let iosAdvancedCourse = Course(name: "iOS Advanced", faculty: "iOS", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)

		let androidBasicCourse = Course(name: "Android Basic", faculty: "Android", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let androidAdvancedCourse = Course(name: "Android Advanced", faculty: "Android", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)

		let reactBasicCourse = Course(name: "React Basic", faculty: "React", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)
		let reactAdvancedCourse = Course(name: "React Advanced", faculty: "React", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)

		let frontEndCourse = Course(name: "HTML/CSS", faculty: "Front End", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)
		let jsBasicCourse = Course(name: "JS Basic", faculty: "JS", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let jsAdvancedCourse = Course(name: "JS Advanced", faculty: "JS", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)

		let uiCourse = Course(name: "UI", faculty: "Web Design", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let uxCourse = Course(name: "UX", faculty: "Web Design", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let tildaCourse = Course(name: "Tilda", faculty: "Web Design", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)

		let qaBasicCourse = Course(name: "QA Basic", faculty: "Testing", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let qaAdvancedCourse = Course(name: "QA Advanced", faculty: "Testing", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)
		let qaAutomationCourse = Course(name: "QA Automation", faculty: "Testing", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)

		let smmCourse = Course(name: "Social Media Marketing", faculty: "Digital Marketing", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)
		let emailCourse = Course(name: "Email Marketing", faculty: "Digital Marketing", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)

		let pmpCourse = Course(name: "Professional Project Management", faculty: "Project Management", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: false)
		let agileScrumCourse = Course(name: "Agile/Scrum", faculty: "Project Management", description: "description", skills: "skills", program: "program", requirements: "requirements", day: false, evening: true)

		let programmingBasicCourse = Course(name: "Basic Programming", faculty: "Programming", description: "description", skills: "skills", program: "program", requirements: "requirements", day: true, evening: true)

		allCourses = [iosBasicCourse, iosAdvancedCourse, androidBasicCourse, androidAdvancedCourse, reactBasicCourse, reactAdvancedCourse, frontEndCourse, jsBasicCourse, jsAdvancedCourse, uiCourse, uxCourse, tildaCourse, qaBasicCourse, qaAdvancedCourse, qaAutomationCourse, smmCourse, emailCourse, pmpCourse, agileScrumCourse, programmingBasicCourse]
	}
}

//MARK: - Make Student extension
extension FacultyController {

	func makeStudent() {
		signedInStudent = Student(firstName: "Mike", lastName: "Tsyba", age: "41", city: "Kiev", birthday: "09-04-1978", phone: "+380503387901", workPlace: "Home Office", email: "@", password: "m", currentCourse: "iOS Basic", completedCourses: ["Basic Programming"])
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

