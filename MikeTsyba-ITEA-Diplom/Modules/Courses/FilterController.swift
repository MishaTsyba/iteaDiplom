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
	var newAllCatehdrals = [NewCatehdral]()

	//init data
	let name = Name()
	let time = Time()

	//output data
	var timeFilterFacultyValues = [String]()
	var typeFilterFacultyValues = [String]()
	var savedTimeFilterFacultyValues = [String]()
	var savedTypeFilterFacultyValues = [String]()
	
	//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
		debugPrint("*********** filter viewDidLoad  **************")
		makeFilterNames()
		designViews(view: filterTitleView)
		designViews(view: backButtonView)
		designViews(view: saveButtonView)
		designViews(view: shadowFilterView)
		designViews(view: dayFilterView)
		designViews(view: eveningFilterView)
		designViews(view: allTypesFilterView)
		designViews(view: mobDevFilterView)
		designViews(view: feDevFilterView)
		designViews(view: designFilterView)
		designViews(view: qaFilterView)
		designViews(view: programmingFilterView)
		designViews(view: otherFilterView)
		designLabels(view: titleLabel)
		designLabels(view: timeFilterLabel)
		designLabels(view: typeFilterLabel)

		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
    }

	//MARK: - viewWillAppear
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		debugPrint("*********** filter viewWillAppear  **************")
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
		toggleTimeFilter(timeFilter: savedTimeFilterFacultyValues)
		toggleTypeFilter(typeFilter: savedTypeFilterFacultyValues)
    }


	//MARK: - Day Filter Button Actions
	@IBAction func didTapDayFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		timeFilterFacultyValues = []
		timeFilterFacultyValues.append(time.day)
		debugPrint("*********** tap end  **************")
		for filter in timeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(timeFilterFacultyValues.count)")
		debugPrint("\(timeFilterFacultyValues)")
		toggleTimeFilter(timeFilter: timeFilterFacultyValues)
	}
	
	//MARK: - Evening Filter Button Actions
	@IBAction func didTapEveningFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		timeFilterFacultyValues = []
		timeFilterFacultyValues.append(time.evening)
		debugPrint("*********** tap end  **************")
		for filter in timeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(timeFilterFacultyValues.count)")
		debugPrint("\(timeFilterFacultyValues)")
		toggleTimeFilter(timeFilter: timeFilterFacultyValues)
	}
	
	//MARK: - Alltypes Filter Button Actions
	@IBAction func didTapAllTypesFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.allTypes)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - Mobile Filter Button Actions
	@IBAction func didTapMobDevFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.mobDev)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - FE Filter Button Actions
	@IBAction func didTapFeDevFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.feDev)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - Design Filter Button Actions
	@IBAction func didTapDesignFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.design)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - Programming Filter Button Actions
	@IBAction func didTapProgrammingFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.programming)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - QA Filter Button Actions
	@IBAction func didTapQaFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.qa)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - Other Filter Button Actions
	@IBAction func didTapOtherFilterButton(_ sender: Any) {
		debugPrint("*********** tap start  **************")
		typeFilterFacultyValues = []
		typeFilterFacultyValues.append(name.other)
		toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		debugPrint("*********** tap end  **************")
		for filter in typeFilterFacultyValues {
			debugPrint("\(filter)")
		}
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
	}
	
	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let viewControllersOfNavigation = navigationController?.viewControllers

		if let controllers = viewControllersOfNavigation {

			if let facultyController = controllers[1] as? FacultyController {
				facultyController.timeFilterFacultyValues = self.timeFilterFacultyValues
				facultyController.typeFilterFacultyValues = self.typeFilterFacultyValues
				facultyController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
				facultyController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
				
				debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
				debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
				debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
				debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
				navigationController?.popToViewController(facultyController, animated: false)
			}
		}
	}
	
	//MARK: - Save Button Actions
	@IBAction func didTapSaveButton(_ sender: Any) {
		debugPrint("*********** tap save  **************")
		savedTimeFilterFacultyValues = timeFilterFacultyValues
		savedTypeFilterFacultyValues = typeFilterFacultyValues
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
	}
}

//MARK: - tap Filters Actions Extension
extension FilterController {
	func toggleTimeFilter(timeFilter: [String]) {

		if timeFilter.contains(time.day) {
			dayCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			dayCircleImageView.image = UIImage(named: name.filterOff)
		}

		if timeFilter.contains(time.evening) {
			eveningCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			eveningCircleImageView.image = UIImage(named: name.filterOff)
		}
	}

	func toggleTypeFilter(typeFilter: [String]) {

		if typeFilter.contains(name.allTypes) {
			allTypesCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			allTypesCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.mobDev) {
			mobDevCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			mobDevCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.feDev) {
			feDevCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			feDevCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.design) {
			designCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			designCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.programming) {
			programmingCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			programmingCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.qa) {
			qaCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			qaCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.other) {
			otherCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			otherCircleImageView.image = UIImage(named: name.filterOff)
		}

		if typeFilter.contains(name.allTypes) {
			allTypesCircleImageView.image = UIImage(named: name.filterOn)
		} else {
			allTypesCircleImageView.image = UIImage(named: name.filterOff)
		}
	}
}

//MARK: - Extension make filter Names
extension FilterController {
	func makeFilterNames() {
		dayFilterLabel.text = time.day
		eveningFilterLabel.text = time.evening
		allTypesFilterLabel.text = name.allTypes
		mobDevFilterLabel.text = name.mobDev
		feDevFilterLabel.text = name.feDev
		designFilterLabel.text = name.design
		programmingFilterLabel.text = name.programming
		qaFilterLabel.text = name.qa
		otherFilterLabel.text = name.other
	}
}

//MARK: - Design UI Extension
extension FilterController {

	//MARK: - Design UI
	func designViews(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.9
		view.layer.shadowRadius = 3

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}

	//MARK: - Design Labels
	func designLabels(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.7
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 0
	}

	//MARK: - Design Icons
	func designIcons(view: UIView) {

		//MARK: - set view properties
		view.clipsToBounds = true
		view.layer.masksToBounds = false

		//MARK: - set view shadow
		view.layer.shadowColor = UIColor.black.cgColor
		view.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)
		view.layer.shadowOpacity = 0.4
		view.layer.shadowRadius = 0.5

		//MARK: - set view corner radius
		view.layer.cornerRadius = 7
	}
}
