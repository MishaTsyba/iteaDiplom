//
//  NewCourse.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/30/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

class NewCourse {
	var name = String()
	var description = String()
	var skills = String()
	var program = String()
	var requirements = String()
	var faculty = String()
	var time = String()

	init(name: String, description: String, skills: String, program: String, requirements: String, faculty: String, time: String) {

		self.name = name
		self.description = description
		self.skills = skills
		self.program = program
		self.requirements = requirements
		self.faculty = faculty
		self.time = time
	}
}
