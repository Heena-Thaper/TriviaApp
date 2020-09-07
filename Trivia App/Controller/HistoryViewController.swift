//
//  HistoryViewController.swift
//  Trivia App
//
//  Created by heena thapar on 06/09/20.
//  Copyright © 2020 heena thapar. All rights reserved.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var gameDetails = [GameDetail]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor(red: 228/255, green: 34/255, blue: 35/255, alpha: 1)
        self.navigationItem.title = summary
        fetchGameDetails()
        configTableView()

    }
    
    func fetchGameDetails(){
        let fetchRequest: NSFetchRequest<GameDetail> = GameDetail.fetchRequest()
        do {
            let details = try PersistenceService.context.fetch(fetchRequest)
            self.gameDetails = details
        }catch {
            print("Error")
        }
       
        print(gameDetails)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
     func configTableView(){
       tableView.delegate = self
       tableView.dataSource = self
       tableView.register(UINib(nibName: historyCell, bundle: nil), forCellReuseIdentifier: historyCell)
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: historyCell) as? HistoryCell else {
           return UITableViewCell()
       }
        let details = gameDetails[indexPath.row]
        cell.setUpView(details: details, index:indexPath.row+1)
       return cell
    }
    
}
