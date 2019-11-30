//
//  TypeFilter.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/30/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

enum TypeFilter {
	case all
	case mobDev
	case feDev
	case design
	case qa
	case other
	case programming
	case none
}

var typeFilterConverter: (String) -> TypeFilter = { typeFilter in
	switch typeFilter {
	case "All":
		return .all
	case "Mobile Development":
		return .mobDev
	case "Front End Development":
		return .feDev
	case "Design":
		return .design
	case "QA":
		return .qa
	case "Other":
		return .other
	case "Programming":
		return .programming
	default:
		return .none
	}
}
