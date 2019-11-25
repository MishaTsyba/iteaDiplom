//
//  CoursesController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class CoursesController: UIViewController {

	//MARK: - Interface Outlets

	//MARK: - Custom variables

	//input data
	var selectedFaculty: Faculty?
	var allCourses: [Course]?
	var filterDayCourse = false
	var filterEveningCourse = false

	//displayed data
	var filteredFacultyCourses: [Course]?

	//transfer data
	var signedInStudent: Student?

	//output data
	var course: Course?

	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
}

//MARK: - Extension

//MARK: - Filter Courses extension
extension CoursesController {

	func makeFilteredCourses(courseTime: Bool, courses: [Course]) {

	}
}
