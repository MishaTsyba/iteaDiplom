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

	//MARK: - Custom variables

	//input data
	var filterFacultyValues: [Bool]?

	//processing data
	var allFaculties: [Faculty]?

	//displayed data
	var filteredFaculties: [Faculty]?

	//output data
	var selectedFaculty: Faculty?
	var allCourses: [Course]?
	var currentStudentCourse: Course?
	var completedStudentCourses: [Course]?
	var orderedStudentCourses: [Course]?
	var filterFacultyNames: [String]?

	//transfer data
	var signedInStudent: Student?
	var filterDayCourse = false
	var filterEveningCourse = false

	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
}

//MARK: - Make Faculties extension
extension FacultyController {

	func makeFilteredFaculties(filterValues: [Bool], faculties: [Faculty]) {

	}

	func makeAllFaculties(faculty: Faculty) {
		let iosFaculty = Faculty(name: "iOS", cathedral: "Mobile Development")
		let androidFaculty = Faculty(name: "Android", cathedral: "Mobile Development")
		let reactFaculty = Faculty(name: "React", cathedral: "Mobile Development")
		let frontEndFaculty = Faculty(name: "Front End", cathedral: "Front End Development")
		let jsFaculty = Faculty(name: "JS", cathedral: "Front End Development")
		let webDesignFaculty = Faculty(name: "Web Design", cathedral: "Design")
		let testingFaculty = Faculty(name: "Testing", cathedral: "QA")
		let digitalMarketingFaculty = Faculty(name: "Digital Marketing", cathedral: "Other")
		let pmFaculty = Faculty(name: "Project Management", cathedral: "Other")
		let programmingFaculty = Faculty(name: "Programming", cathedral: "Programming")

		allFaculties = [iosFaculty, androidFaculty, reactFaculty, frontEndFaculty, jsFaculty, webDesignFaculty, testingFaculty, digitalMarketingFaculty, pmFaculty, programmingFaculty]
	}
}

//MARK: - Make Courses extension
extension FacultyController {
	func makeAllCourses(course: Course) {
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
