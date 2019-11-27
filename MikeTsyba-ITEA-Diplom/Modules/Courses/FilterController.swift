//
//  FilterController.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 11/25/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

class FilterController: UIViewController {

	//MARK: - Interface Outlets

	//MARK: - Custom variables

	//input data
	var filterCathedralNames = [String]()

	//output data
	var filterFacultyValues: [Bool]?
	var filterDayCourse = false
	var filterEveningCourse = false
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("filterCathedralNames: \(filterCathedralNames.count)")
    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
}

//MARK: - Extension
