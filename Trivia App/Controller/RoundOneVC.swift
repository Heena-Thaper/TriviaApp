//
//  RoundOneVC.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit

class RoundOneVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARKS: OUTLETS
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
  
    //MARKS: VARIABLES
    var answerOptions = [""]
    var details = GameDetailsModel()
    var selectedOption = [String]()
    var selectedOptionString = ""
    var selectedIndex = -1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerOptions = GameDetailsModel.getRoundOneOptions()
        configTableView()
        showNextButton()
    }

    @IBAction func nextAction(_ sender: Any) {
        saveDetails()
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: roundTwo) as? RoundTwoVC else { return }
        nextVC.details = details
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    func saveDetails(){
        details.answerOne = selectedOptionString

    }
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: checkBox, bundle: nil), forCellReuseIdentifier: checkBox)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answerOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: checkBox) as? CheckBoxCell else {
            return UITableViewCell()
        }
        let name = answerOptions[indexPath.row]
        cell.answerLbl.text = name
        cell.setViewForRadioCell()
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
   
}
extension RoundOneVC: CheckboxCellDelegate{
    func checkboxSelected(at index: Int) {
        if selectedOption.count > 0 {
            checkboxUnselected(at: index)
        }
        self.selectedOption = [answerOptions[index]]
        self.selectedOptionString = selectedOption.first ?? ""
        
        let previousCell = tableView.cellForRow(at: IndexPath(item: selectedIndex, section: 0)) as? CheckBoxCell
        previousCell?.checkBoxButton.isSelected = false
        selectedIndex = index
        let currentIndex = tableView.cellForRow(at: IndexPath(item: selectedIndex, section: 0)) as? CheckBoxCell
        currentIndex?.checkBoxButton.isSelected = true
        showNextButton()
    }
    
    func checkboxUnselected(at index: Int) {
        self.selectedOption.removeAll()
        showNextButton()
    }
    
    func showNextButton() {
        if selectedOption.count > 0 {
            self.nextButton.isHidden = false
        }else {
            self.nextButton.isHidden = true
        }
    }
    
    
}

