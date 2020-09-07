//
//  CheckBoxCell.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit
protocol CheckboxCellDelegate {
    func checkboxSelected(at index: Int)
    func checkboxUnselected(at index: Int)
}

class CheckBoxCell: UITableViewCell {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var answerLbl: UILabel!
    
    var delegate:CheckboxCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkBoxButton.isSelected = false

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func checkBoxAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            delegate?.checkboxSelected(at: self.tag)
        }else {
            delegate?.checkboxUnselected(at: self.tag)
        }
        setViewForRadioCell()

    }
    
    func setViewForRadioCell(){
        checkBoxButton.setImage(UIImage(named: "radioOFF"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "radioON"), for: .selected)
    }
    func setViewForCheckboxCell(){
        checkBoxButton.setImage(UIImage(named: "checkboxUnselected"), for: .normal)
        checkBoxButton.setImage(UIImage(named: "checkboxSelected"), for: .selected)

    }
}
