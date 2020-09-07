//
//  RoundTwoVC.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit

class RoundTwoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARKS: OUTLETS
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    //MARKS: VARIABLES
    var answerOptions = [""]
    var details = GameDetailsModel()
    var selectedOption = [String]()
    var selectedOptionString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answerOptions = GameDetailsModel.getRoundTwoOptions()
        configTableView()
        showNextButton()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        saveData()
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: result) as? ResultViewController else { return }
        nextVC.details = details
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    //MARKS: Saving details in CORE DATA
    func saveData(){
        for options in selectedOption {
              selectedOptionString.append(options)
              selectedOptionString.append(",")
          }
          selectedOptionString.removeLast()
        details.answerTwo = selectedOptionString
        let gameDetails = GameDetail(context: PersistenceService.context)
        gameDetails.answerOne = details.answerOne
        gameDetails.answerTwo = details.answerTwo
        gameDetails.name = details.name
        gameDetails.dateTime = details.dateTime
        PersistenceService.saveContext()
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
        cell.answerLbl.text = answerOptions[indexPath.row]
        cell.setViewForRadioCell()
        cell.delegate = self
        cell.tag = indexPath.row
        return cell
    }
   
}

extension RoundTwoVC: CheckboxCellDelegate{
    func checkboxSelected(at index: Int) {
        self.selectedOption.append(self.answerOptions[index])
        showNextButton()
    }
    
    func checkboxUnselected(at index: Int) {
        for i in 0..<selectedOption.count {
            guard index < selectedOption.count else {return}
            if selectedOption[i] == answerOptions[index] {
                self.selectedOption.remove(at: i)
                break
            }
        }
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
