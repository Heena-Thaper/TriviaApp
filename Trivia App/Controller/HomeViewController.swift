//
//  HomeViewController.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//



// MARKS: Dont having the logos So I'm using label instead of logo
import UIKit

class HomeViewController: UIViewController {

    //MARKS: OUTLETS
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var details: GameDetailsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        self.navigationController?.navigationBar.isHidden = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        nameField.text = ""
        self.nextButton.isHidden = true
    }

    @IBAction func nextAction(_ sender: Any) {
        saveDetails()
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: roundOne) as? RoundOneVC else { return }
        nextVC.details = self.details
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func saveDetails(){
        let date = Date().formattedWith("dd MMMM hh:mm a")
        let name = nameField.text ?? ""
        details = GameDetailsModel()
        details.name = name
        details.dateTime = date
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = textField.text! as NSString
        let name: String = currentString.replacingCharacters(in: range, with: string) as String
        if name.isEmpty {
            self.nextButton.isHidden = true
        }else if name.count > 2 {
            self.nextButton.isHidden = false
        }
        return true
    }
 
}
extension Date {
    func formattedWith(_ format:String) -> String {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale?
        formatter.dateFormat = format
        formatter.timeZone = TimeZone.current
        return formatter.string(from: self)
    }
}
