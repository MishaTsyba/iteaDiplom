//
//  Course.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/24/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

class Course {
	var day: Bool?
	var evening: Bool?
	var faculty: String?
	var name: String?
	var description: String?
	var skills: String?
	var program: String?
	var requirements: String?

	init(name: String?, faculty: String?, description: String?, skills: String?, program: String?, requirements: String?, day: Bool?, evening: Bool?) {

		self.name = name
		self.description = description
		self.skills = skills
		self.program = program
		self.requirements = requirements
		self.day = day
		self.evening = evening
	}
}
