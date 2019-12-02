//
//  FilterController+Extensions.swift
//  MikeTsyba-ITEA-Diplom
//
//  Created by Mykhailo Tsyba on 12/2/19.
//  Copyright © 2019 miketsyba. All rights reserved.
//

import UIKit

//MARK: - set Button Tags extension
extension FilterController {
	func setButtonTags() {
		dayFilterButton.tag = 1
		eveningFilterButton.tag = 2
		allTypesFilterButton.tag = 3
		mobDevFilterButton.tag = 4
		feDevFilterButton.tag = 5
		designFilterButton.tag = 6
		programmingFilterButton.tag = 7
		qaFilterButton.tag = 8
		otherFilterButton.tag = 9
	}
}

//MARK: - Design Controller UI Extension
extension FilterController {
	func designUi() {
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
	}
}

//MARK: - tap Filter Buttons s Actions Extension
extension FilterController {
	func toggleFilter(sender: UIButton) {
		switch sender.tag {
		case 1:
			timeFilterFacultyValues = []
			timeFilterFacultyValues.append(time.day)
			toggleTimeFilter(timeFilter: timeFilterFacultyValues)
		case 2:
			timeFilterFacultyValues = []
			timeFilterFacultyValues.append(time.evening)
			toggleTimeFilter(timeFilter: timeFilterFacultyValues)
		case 3:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.allTypes)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 4:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.mobDev)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 5:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.feDev)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 6:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.design)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 7:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.programming)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 8:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.qa)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		case 9:
			typeFilterFacultyValues = []
			typeFilterFacultyValues.append(name.other)
			toggleTypeFilter(typeFilter: typeFilterFacultyValues)
		default:
			debugPrint("from toggle filter")
		}

	}
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
