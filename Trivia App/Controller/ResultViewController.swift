//
//  ResultViewController.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var details = GameDetailsModel()

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var answerTwoLbl: UILabel!
    @IBOutlet weak var answerOneLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "Hello \(details.name ?? ""):"
        answerOneLbl.text = "Answer: \(details.answerOne ?? "")"
        answerTwoLbl.text = "Answer: \(details.answerTwo ?? "")"

    }
    

    @IBAction func finishAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
   
    
    @IBAction func summaryAction(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: history)as? HistoryViewController else { return }
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}
