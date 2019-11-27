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
	@IBOutlet weak var filterBackgroundView: UIView!
	@IBOutlet weak var filterBackgroundImageView: UIImageView!

	@IBOutlet weak var filterTitleView: UIView!
	@IBOutlet weak var saveButtonView: UIView!
	@IBOutlet weak var saveButton: UIButton!
	@IBOutlet weak var backButtonView: UIView!
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var titleLabel: UILabel!

	@IBOutlet weak var shadowFilterView: UIView!
	@IBOutlet weak var filterContentView: UIView!

	@IBOutlet weak var timeFilterView: UIView!
	@IBOutlet weak var timeFilterLabel: UILabel!

	@IBOutlet weak var dayFilterView: UIView!
	@IBOutlet weak var dayCircleImageView: UIImageView!
	@IBOutlet weak var dayFilterLabel: UILabel!
	@IBOutlet weak var dayFilterButton: UIButton!

	@IBOutlet weak var eveningFilterView: UIView!
	@IBOutlet weak var eveningCircleImageView: UIImageView!
	@IBOutlet weak var eveningFilterLabel: UILabel!
	@IBOutlet weak var eveningFilterButton: UIButton!

	@IBOutlet weak var typeFilterView: UIView!
	@IBOutlet weak var typeFilterLabel: UILabel!

	@IBOutlet weak var allTypesFilterView: UIView!
	@IBOutlet weak var allTypesCircleImageView: UIImageView!
	@IBOutlet weak var allTypesFilterLabel: UILabel!
	@IBOutlet weak var allTypesFilterButton: UIButton!

	@IBOutlet weak var mobDevFilterView: UIView!
	@IBOutlet weak var mobDevCircleImageView: UIImageView!
	@IBOutlet weak var mobDevFilterLabel: UILabel!
	@IBOutlet weak var mobDevFilterButton: UIButton!

	@IBOutlet weak var feDevFilterView: UIView!
	@IBOutlet weak var feDevCircleImageView: UIImageView!
	@IBOutlet weak var feDevFilterLabel: UILabel!
	@IBOutlet weak var feDevFilterButton: UIButton!

	@IBOutlet weak var designFilterView: UIView!
	@IBOutlet weak var designCircleImageView: UIImageView!
	@IBOutlet weak var designFilterLabel: UILabel!
	@IBOutlet weak var designFilterButton: UIButton!

	@IBOutlet weak var programmingFilterView: UIView!
	@IBOutlet weak var programmingCircleImageView: UIImageView!
	@IBOutlet weak var programmingFilterLabel: UILabel!
	@IBOutlet weak var programmingFilterButton: UIButton!

	@IBOutlet weak var qaFilterView: UIView!
	@IBOutlet weak var qaCircleImageView: UIImageView!
	@IBOutlet weak var qaFilterLabel: UILabel!
	@IBOutlet weak var qaFilterButton: UIButton!

	@IBOutlet weak var otherFilterView: UIView!
	@IBOutlet weak var otherCircleImageView: UIImageView!
	@IBOutlet weak var otherFilterLabel: UILabel!
	@IBOutlet weak var otherFilterButton: UIButton!

	//MARK: - Custom variables

	//input data
	//var filterCathedralNames = [String]()

	//output data
	var filterFacultyValues: [Bool]?
	var filterDayCourse = false
	var filterEveningCourse = false
	
	//MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
		//filterCathedralNames.append("All Types")
		//debugPrint("filterCathedralNames: \(filterCathedralNames.count)")

    }

	//MARK: - viewWillAppear

	//MARK: - Button Actions
}

//MARK: - Extension


//MARK: - Extension make filter Names
extension FilterController {
	func makeFilterNames() {
		dayFilterLabel.text = "Day"
		eveningFilterLabel.text = "Evening"
		allTypesFilterLabel.text = "All Types"
		mobDevFilterLabel.text = "Mobile Development"
		feDevFilterLabel.text = "Front End Development"
		designFilterLabel.text = "Design"
		programmingFilterLabel.text = "Programming"
		qaFilterLabel.text = "QA"
		otherFilterLabel.text = "Other"
	}
}

