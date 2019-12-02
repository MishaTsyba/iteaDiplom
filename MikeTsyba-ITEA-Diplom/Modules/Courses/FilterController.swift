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
	var signedInStudent: Student?
	var newAllCourses = [NewCourse]()

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
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")

		setButtonTags()
		makeFilterNames()
		designUi()
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
	@IBAction func didTapDayFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(timeFilterFacultyValues.count)")
		debugPrint("\(timeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - Evening Filter Button Actions
	@IBAction func didTapEveningFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(timeFilterFacultyValues.count)")
		debugPrint("\(timeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - Alltypes Filter Button Actions
	@IBAction func didTapAllTypesFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - Mobile Filter Button Actions
	@IBAction func didTapMobDevFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - FE Filter Button Actions
	@IBAction func didTapFeDevFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}

	//MARK: - Design Filter Button Actions
	@IBAction func didTapDesignFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}

	//MARK: - Programming Filter Button Actions
	@IBAction func didTapProgrammingFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - QA Filter Button Actions
	@IBAction func didTapQaFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - Other Filter Button Actions
	@IBAction func didTapOtherFilterButton(_ sender: UIButton) {
		debugPrint("*********** tap start  **************")
		toggleFilter(sender: sender)
		debugPrint("sender: \(sender.tag)")
		debugPrint("\(typeFilterFacultyValues.count)")
		debugPrint("\(typeFilterFacultyValues)")
		debugPrint("*********** tap end  **************")
	}
	
	//MARK: - Back Button Actions
	@IBAction func didTapBackButton(_ sender: Any) {
		debugPrint("*********** tap back  **************")
		let coursesStoryboard = UIStoryboard(name: "Courses", bundle: nil)
		let facultyController = coursesStoryboard.instantiateViewController(withIdentifier: "FacultyController") as! FacultyController
		facultyController.signedInStudent = self.signedInStudent
		facultyController.timeFilterFacultyValues = self.timeFilterFacultyValues
		facultyController.typeFilterFacultyValues = self.typeFilterFacultyValues
		facultyController.savedTimeFilterFacultyValues = self.savedTimeFilterFacultyValues
		facultyController.savedTypeFilterFacultyValues = self.savedTypeFilterFacultyValues
		facultyController.newAllCourses = self.newAllCourses
		debugPrint("timeFilterFacultyValues: \(timeFilterFacultyValues)")
		debugPrint("typeFilterFacultyValues: \(typeFilterFacultyValues)")
		debugPrint("savedTimeFilterFacultyValues: \(savedTimeFilterFacultyValues)")
		debugPrint("savedTypeFilterFacultyValues: \(savedTypeFilterFacultyValues)")
		navigationController?.pushViewController(facultyController, animated: false)
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
