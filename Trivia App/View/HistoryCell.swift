//
//  HistoryCell.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var quesOneLbl: UILabel!
    @IBOutlet weak var ansOneLbl: UILabel!
    @IBOutlet weak var quesTwoLbl: UILabel!
    @IBOutlet weak var ansTwoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bgView.layer.borderColor = UIColor(red: 228/255, green: 34/255, blue: 35/255, alpha: 1).cgColor
        bgView.layer.borderWidth = 0.8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setUpView(details: GameDetail, index:Int){
        self.dateLbl.text = "Game \(index): \(details.dateTime ?? "")"
        self.nameLbl.text = "Name: \(details.name ?? "")"
        self.ansOneLbl.text = "Answer: \(details.answerOne ?? "")"
        self.ansTwoLbl.text = "Answer: \(details.answerTwo ?? "")"

        
    }
    
}
