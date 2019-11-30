//
//  TimeFilter.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/30/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import Foundation

enum TimeFilter {
	case day
	case evening
	case none
}

var timeFilterConverter: (String) -> TimeFilter = { timeFilter in
	switch timeFilter {
	case "Day":
		return .day
	case "Evening":
		return .evening
	default:
		return .none
	}
}
