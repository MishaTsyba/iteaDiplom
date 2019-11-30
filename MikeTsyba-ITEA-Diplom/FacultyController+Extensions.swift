//
//  FacultyController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/30/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

extension FacultyController {
	func setDataModel() {

		let cathedralName = CathedralName()

		let facultyName = FacultyName()
		let facultyCathedral = FacultyCathedral()

		let courseName = CourseName()
		let courseDescription = CourseDescription()
		let courseSkills = CourseSkills()
		let courseProgram = CourseProgram()
		let courseRequirements = CourseRequirements()
		let courseFaculty = CourseFaculty()
		let courseTime = CourseTime()

		let mdCathedral = NewCatehdral(name: cathedralName.mobDev)
		let feCathedral = NewCatehdral(name: cathedralName.feDev)
		let designCathedral = NewCatehdral(name: cathedralName.design)
		let qaCathedral = NewCatehdral(name: cathedralName.qa)
		let progCathedral = NewCatehdral(name: cathedralName.prog)
		let otherCathedral = NewCatehdral(name: cathedralName.other)

		let iosFaculty = NewFaculty(name: facultyName.ios, cathedral: facultyCathedral.ios, imageName: "ios")
		let androidFaculty = NewFaculty(name: facultyName.android, cathedral: facultyCathedral.android, imageName: "android")
		let reactFaculty = NewFaculty(name: facultyName.react, cathedral: facultyCathedral.react, imageName: "react")
		let feFaculty = NewFaculty(name: facultyName.fe, cathedral: facultyCathedral.fe, imageName: "fe")
		let jsFaculty = NewFaculty(name: facultyName.js, cathedral: facultyCathedral.js, imageName: "js")
		let wdFaculty = NewFaculty(name: facultyName.wd, cathedral: facultyCathedral.wd, imageName: "wd")
		let testingFaculty = NewFaculty(name: facultyName.testing, cathedral: facultyCathedral.testing, imageName: "test")
		let dmFaculty = NewFaculty(name: facultyName.dm, cathedral: facultyCathedral.dm, imageName: "dm")
		let pmFaculty = NewFaculty(name: facultyName.pm, cathedral: facultyCathedral.pm, imageName: "pm")
		let progFaculty = NewFaculty(name: facultyName.prog, cathedral: facultyCathedral.prog, imageName: "prog")

		let iosBasicCourse = NewCourse(name: courseName.iosBasic, description: courseDescription.iosBasic, skills: courseSkills.iosBasic, program: courseProgram.iosBasic, requirements: courseRequirements.iosBasic, faculty: courseFaculty.iosBasic, time: courseTime.iosBasic)

		let iosAdvancedCourse = NewCourse(name: courseName.iosAdvanced, description: courseDescription.iosAdvanced, skills: courseSkills.iosAdvanced, program: courseProgram.iosAdvanced, requirements: courseRequirements.iosAdvanced, faculty: courseFaculty.iosAdvanced, time: courseTime.iosAdvanced)

		let androidBasicCourse = NewCourse(name: courseName.androidBasic, description: courseDescription.androidBasic, skills: courseSkills.androidBasic, program: courseProgram.androidBasic, requirements: courseRequirements.androidBasic, faculty: courseFaculty.androidBasic, time: courseTime.androidBasic)

		let androidAdvancedCourse = NewCourse(name: courseName.androidAdvanced, description: courseDescription.androidAdvanced, skills: courseSkills.androidAdvanced, program: courseProgram.androidAdvanced, requirements: courseRequirements.androidAdvanced, faculty: courseFaculty.androidAdvanced, time: courseTime.androidAdvanced)

		let reactBasicCourse = NewCourse(name: courseName.reactBasic, description: courseDescription.reactBasic, skills: courseSkills.reactBasic, program: courseProgram.reactBasic, requirements: courseRequirements.reactBasic, faculty: courseFaculty.reactBasic, time: courseTime.reactBasic)

		let reactAdvancedCourse = NewCourse(name: courseName.reactAdvanced, description: courseDescription.reactAdvanced, skills: courseSkills.reactAdvanced, program: courseProgram.reactAdvanced, requirements: courseRequirements.reactAdvanced, faculty: courseFaculty.reactAdvanced, time: courseTime.reactAdvanced)

		let htmlCssCourse = NewCourse(name: courseName.htmlCss, description: courseDescription.htmlCss, skills: courseSkills.htmlCss, program: courseProgram.htmlCss, requirements: courseRequirements.htmlCss, faculty: courseFaculty.htmlCss, time: courseTime.htmlCss)

		let jsBasicCourse = NewCourse(name: courseName.jsBasic, description: courseDescription.jsBasic, skills: courseSkills.jsBasic, program: courseProgram.jsBasic, requirements: courseRequirements.jsBasic, faculty: courseFaculty.jsBasic, time: courseTime.jsBasic)

		let jsAdvancedCourse = NewCourse(name: courseName.jsAdvanced, description: courseDescription.jsAdvanced, skills: courseSkills.jsAdvanced, program: courseProgram.jsAdvanced, requirements: courseRequirements.jsAdvanced, faculty: courseFaculty.jsAdvanced, time: courseTime.jsAdvanced)

		let uiCourse = NewCourse(name: courseName.ui, description: courseDescription.ui, skills: courseSkills.ui, program: courseProgram.ui, requirements: courseRequirements.ui, faculty: courseFaculty.ui, time: courseTime.ui)
		
		let uxCourse = NewCourse(name: courseName.ux, description: courseDescription.ux, skills: courseSkills.ux, program: courseProgram.ux, requirements: courseRequirements.ux, faculty: courseFaculty.ux, time: courseTime.ux)

		let tildaCourse = NewCourse(name: courseName.tilda, description: courseDescription.tilda, skills: courseSkills.tilda, program: courseProgram.tilda, requirements: courseRequirements.tilda, faculty: courseFaculty.tilda, time: courseTime.tilda)

		let qaBasicCourse = NewCourse(name: courseName.qaBasic, description: courseDescription.qaBasic, skills: courseSkills.qaBasic, program: courseProgram.qaBasic, requirements: courseRequirements.qaBasic, faculty: courseFaculty.qaBasic, time: courseTime.qaBasic)

		let qaAdvancedCourse = NewCourse(name: courseName.qaAdvanced, description: courseDescription.qaAdvanced, skills: courseSkills.qaAdvanced, program: courseProgram.qaAdvanced, requirements: courseRequirements.qaAdvanced, faculty: courseFaculty.qaAdvanced, time: courseTime.qaAdvanced)

		let qaAutomationCourse = NewCourse(name: courseName.qaAutomation, description: courseDescription.qaAutomation, skills: courseSkills.qaAutomation, program: courseProgram.qaAutomation, requirements: courseRequirements.qaAutomation, faculty: courseFaculty.qaAutomation, time: courseTime.qaAutomation)

		let smmCourse = NewCourse(name: courseName.smm, description: courseDescription.smm, skills: courseSkills.smm, program: courseProgram.smm, requirements: courseRequirements.smm, faculty: courseFaculty.smm, time: courseTime.smm)

		let emailCourse = NewCourse(name: courseName.emailMarketing, description: courseDescription.emailMarketing, skills: courseSkills.emailMarketing, program: courseProgram.emailMarketing, requirements: courseRequirements.emailMarketing, faculty: courseFaculty.emailMarketing, time: courseTime.emailMarketing)

		let pmpCourse = NewCourse(name: courseName.profPm, description: courseDescription.profPm, skills: courseSkills.profPm, program: courseProgram.profPm, requirements: courseRequirements.profPm, faculty: courseFaculty.profPm, time: courseTime.profPm)

		let agileScrumCourse = NewCourse(name: courseName.agileScrum, description: courseDescription.agileScrum, skills: courseSkills.agileScrum, program: courseProgram.agileScrum, requirements: courseRequirements.agileScrum, faculty: courseFaculty.agileScrum, time: courseTime.agileScrum)

		let programmingBasicCourse = NewCourse(name: courseName.progBasic, description: courseDescription.progBasic, skills: courseSkills.progBasic, program: courseProgram.progBasic, requirements: courseRequirements.progBasic, faculty: courseFaculty.progBasic, time: courseTime.progBasic)

		newAllCatehdrals = [mdCathedral, feCathedral, designCathedral, qaCathedral, otherCathedral, progCathedral]
		newAllFaculties = [iosFaculty, androidFaculty, reactFaculty, feFaculty, jsFaculty, wdFaculty, testingFaculty, dmFaculty, pmFaculty, progFaculty]
		newAllCourses = [iosBasicCourse, iosAdvancedCourse, androidBasicCourse, androidAdvancedCourse, reactBasicCourse, reactAdvancedCourse, htmlCssCourse, jsBasicCourse, jsAdvancedCourse, uiCourse, uxCourse, tildaCourse, qaBasicCourse, qaAdvancedCourse, qaAutomationCourse, smmCourse, emailCourse, pmpCourse, agileScrumCourse, programmingBasicCourse]
	}
}
