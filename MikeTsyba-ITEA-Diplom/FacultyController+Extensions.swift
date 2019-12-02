//
//  FacultyController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/30/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - Design Controller UI Delegate extension
extension FacultyController {
	func designUi() {
		designViews(view: titleView)
		designViews(view: profileButtonView)
		designViews(view: filterButtonView)
		designViews(view: shadowCollectionView)
		designLabels(view: titleLabel)
	}

	func setTitleLAbel() {
		if timeFilterFacultyValues.isEmpty && savedTimeFilterFacultyValues.isEmpty {
			titleLabel.text = "All Courses"
		}
		if timeFilterFacultyValues.contains(time.day) || savedTimeFilterFacultyValues.contains(time.day) {
			titleLabel.text = time.day + " Courses"
		}
		if timeFilterFacultyValues.contains(time.evening) || savedTimeFilterFacultyValues.contains(time.evening) {
			titleLabel.text = time.evening + " Courses"
		}
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

		coursesController.newAllCourses = self.newAllCourses
		coursesController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
		coursesController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
		coursesController.newAllCourses = self.newAllCourses
		coursesController.signedInStudent = self.signedInStudent
		coursesController.timeFilterFacultyValues = self.timeFilterFacultyValues

		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.name)))")
		debugPrint("selectedFaculty: \(String(describing: selectedFaculty?.imageName))")
		debugPrint("allCourses: \(String(describing: self.newAllCourses))")
		debugPrint("signedInStudent: \(String(describing: self.signedInStudent))")
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")

		navigationController?.pushViewController(coursesController, animated: false)
	}
}

//MARK: - Make Student Courses extension
extension FacultyController {

	func makeStudentCorses(signedInStudent: Student?, courses: [NewCourse]) {
		if let student = signedInStudent {
			for course in courses {
				if let currentStudentCourses = student.currentCourses {
					for currentCourseName in currentStudentCourses {
						if currentCourseName == course.name {
							studentCurrentCourses.append(course)
						}
					}
				}

				if let lastStudentCourses = student.lastCourses {
					for lastCourseName in lastStudentCourses {
						if lastCourseName == course.name {
							studentLastCourses.append(course)
						}
					}
				}
			}
		}
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

//MARK: - Make Filtered Student Courses extension
extension FacultyController {

	func makeFilteredStudentCourses() {

	}
}

//MARK: - Design UI Extension
extension FacultyController {

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

//MARK: - set Data Model
extension FacultyController {
	func setDataModel() {

		//MARK: - Make Initial Data Objects
		let description = Description()
		let skills = Skills()
		let program = Program()
		let requirements = Requirements()

		//MARK: - Make Catehdral Objects
		let allCathedrals = NewCatehdral(name: name.allTypes)
		let mdCathedral = NewCatehdral(name: name.mobDev)
		let feCathedral = NewCatehdral(name: name.feDev)
		let designCathedral = NewCatehdral(name: name.design)
		let qaCathedral = NewCatehdral(name: name.qa)
		let otherCathedral = NewCatehdral(name: name.other)
		let progCathedral = NewCatehdral(name: name.programming)

		//MARK: - Make Faculty Objects
		let iosFaculty = NewFaculty(name: name.ios, cathedral: mdCathedral.name, imageName: name.iosImage)
		let androidFaculty = NewFaculty(name: name.android, cathedral: mdCathedral.name, imageName: name.androidImage)
		let reactFaculty = NewFaculty(name: name.react, cathedral: mdCathedral.name, imageName: name.reactImage)

		let feFaculty = NewFaculty(name: name.fe, cathedral: feCathedral.name, imageName: name.feImage)
		let jsFaculty = NewFaculty(name: name.js, cathedral: feCathedral.name, imageName: name.jsImage)

		let wdFaculty = NewFaculty(name: name.wd, cathedral: designCathedral.name, imageName: name.wdImage)

		let testingFaculty = NewFaculty(name: name.testing, cathedral: qaCathedral.name, imageName: name.testsImage)

		let dmFaculty = NewFaculty(name: name.dm, cathedral: otherCathedral.name, imageName: name.dmImage)
		let pmFaculty = NewFaculty(name: name.pm, cathedral: otherCathedral.name, imageName: name.pmImage)
		
		let genProgFaculty = NewFaculty(name: name.genProgramming, cathedral: progCathedral.name, imageName: name.gpImage)

		//MARK: - Make Course Objects
		let iosBasicCourse = NewCourse(name: name.iosBasic, description: description.iosBasic, skills: skills.iosBasic, program: program.iosBasic, requirements: requirements.iosBasic, faculty: iosFaculty.name, time: time.evening)

		let iosAdvancedCourse = NewCourse(name: name.iosAdvanced, description: description.iosAdvanced, skills: skills.iosAdvanced, program: program.iosAdvanced, requirements: requirements.iosAdvanced, faculty: iosFaculty.name, time: time.evening)

		let androidBasicCourse = NewCourse(name: name.androidBasic, description: description.androidBasic, skills: skills.androidBasic, program: program.androidBasic, requirements: requirements.androidBasic, faculty: androidFaculty.name, time: time.evening)

		let androidAdvancedCourse = NewCourse(name: name.androidAdvanced, description: description.androidAdvanced, skills: skills.androidAdvanced, program: program.androidAdvanced, requirements: requirements.androidAdvanced, faculty: androidFaculty.name, time: time.evening)

		let reactBasicCourse = NewCourse(name: name.reactBasic, description: description.reactBasic, skills: skills.reactBasic, program: program.reactBasic, requirements: requirements.reactBasic, faculty: reactFaculty.name, time: time.day)

		let reactAdvancedCourse = NewCourse(name: name.reactAdvanced, description: description.reactAdvanced, skills: skills.reactAdvanced, program: program.reactAdvanced, requirements: requirements.reactAdvanced, faculty: reactFaculty.name, time: time.day)

		let htmlCssCourse = NewCourse(name: name.htmlCss, description: description.htmlCss, skills: skills.htmlCss, program: program.htmlCss, requirements: requirements.htmlCss, faculty: feFaculty.name, time: time.day)

		let jsBasicCourse = NewCourse(name: name.jsBasic, description: description.jsBasic, skills: skills.jsBasic, program: program.jsBasic, requirements: requirements.jsBasic, faculty: jsFaculty.name, time: time.evening)

		let jsAdvancedCourse = NewCourse(name: name.jsAdvanced, description: description.jsAdvanced, skills: skills.jsAdvanced, program: program.jsAdvanced, requirements: requirements.jsAdvanced, faculty: jsFaculty.name, time: time.evening)

		let uiCourse = NewCourse(name: name.ui, description: description.ui, skills: skills.ui, program: program.ui, requirements: requirements.ui, faculty: wdFaculty.name, time: time.evening)
		
		let uxCourse = NewCourse(name: name.ux, description: description.ux, skills: skills.ux, program: program.ux, requirements: requirements.ux, faculty: wdFaculty.name, time: time.evening)

		let tildaCourse = NewCourse(name: name.tilda, description: description.tilda, skills: skills.tilda, program: program.tilda, requirements: requirements.tilda, faculty: wdFaculty.name, time: time.day)

		let qaBasicCourse = NewCourse(name: name.qaBasic, description: description.qaBasic, skills: skills.qaBasic, program: program.qaBasic, requirements: requirements.qaBasic, faculty: testingFaculty.name, time: time.day)

		let qaAdvancedCourse = NewCourse(name: name.qaAdvanced, description: description.qaAdvanced, skills: skills.qaAdvanced, program: program.qaAdvanced, requirements: requirements.qaAdvanced, faculty: testingFaculty.name, time: time.day)

		let qaAutomationCourse = NewCourse(name: name.qaAutomation, description: description.qaAutomation, skills: skills.qaAutomation, program: program.qaAutomation, requirements: requirements.qaAutomation, faculty: testingFaculty.name, time: time.evening)

		let smmCourse = NewCourse(name: name.smm, description: description.smm, skills: skills.smm, program: program.smm, requirements: requirements.smm, faculty: dmFaculty.name, time: time.evening)

		let emailCourse = NewCourse(name: name.emailMarketing, description: description.emailMarketing, skills: skills.emailMarketing, program: program.emailMarketing, requirements: requirements.emailMarketing, faculty: dmFaculty.name, time: time.day)

		let pmpCourse = NewCourse(name: name.profPm, description: description.profPm, skills: skills.profPm, program: program.profPm, requirements: requirements.profPm, faculty: pmFaculty.name, time: time.day)

		let agileScrumCourse = NewCourse(name: name.agileScrum, description: description.agileScrum, skills: skills.agileScrum, program: program.agileScrum, requirements: requirements.agileScrum, faculty: pmFaculty.name, time: time.evening)

		let programmingBasicCourse = NewCourse(name: name.progBasic, description: description.progBasic, skills: skills.progBasic, program: program.progBasic, requirements: requirements.progBasic, faculty: genProgFaculty.name, time: time.day)

		//MARK: - Make Object Arrays
		newAllCatehdrals = [allCathedrals, mdCathedral, feCathedral, designCathedral, qaCathedral, otherCathedral, progCathedral]

		newAllFaculties = [iosFaculty, androidFaculty, reactFaculty, feFaculty, jsFaculty, wdFaculty, testingFaculty, dmFaculty, pmFaculty, genProgFaculty]
		
		newAllCourses = [iosBasicCourse, iosAdvancedCourse, androidBasicCourse, androidAdvancedCourse, reactBasicCourse, reactAdvancedCourse, htmlCssCourse, jsBasicCourse, jsAdvancedCourse, uiCourse, uxCourse, tildaCourse, qaBasicCourse, qaAdvancedCourse, qaAutomationCourse, smmCourse, emailCourse, pmpCourse, agileScrumCourse, programmingBasicCourse]
	}
}
