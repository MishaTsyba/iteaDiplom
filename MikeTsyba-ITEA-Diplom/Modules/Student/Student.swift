//
//  Student.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

class Student {
	var firstName: String?
	var lastName: String?
	var age: String?
	var city: String?
	var birthday: String?
	var phone: String?
	var workPlace: String?
	var email: String?
	var password: String?
	var currentCourse: String?
	var orderedCourses: [String]?
	var completedCourses: [String]?

	init(firstName: String?, lastName: String?, age: String?, city: String?, birthday: String?, phone: String?, workPlace: String?, email: String?, password: String?, currentCourse: String?, completedCourses: [String]?) {

		self.firstName = firstName
		self.lastName = lastName
		self.age = age
		self.city = city
		self.birthday = birthday
		self.phone = phone
		self.workPlace = workPlace
		self.email = email
		self.password = password
		self.currentCourse = currentCourse
		self.completedCourses = completedCourses
	}
}
