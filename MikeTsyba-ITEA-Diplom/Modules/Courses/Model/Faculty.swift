//
//  Faculty.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/25/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

class Faculty {
	var name: String?
	var cathedral: String?
	var imageName: String?

	init(name: String?, cathedral: String?, imageName: String?) {
		self.name = name
		self.cathedral = cathedral
		self.imageName = imageName
	}
}