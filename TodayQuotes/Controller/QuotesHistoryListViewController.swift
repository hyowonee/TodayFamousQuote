//
//  QuotesHistoryListViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class QuotesHistoryListViewController: UIViewController {
    
    @IBOutlet var quotesHistoryListTableView: UITableView!
    let shareDefaults = UserDefaults(suiteName: "group.Hyowonee.Quotes")
    var quoteData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quoteData.append((shareDefaults!.object(forKey: "quoteText") as? String)!)
        print(quoteData)
//        self.quotesHistoryListTableView.reloadData()
    }
}

extension QuotesHistoryListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuotesHistoryCell") as! QuotesHistoryCell
        cell.quotesLabel?.text = "\(quoteData[indexPath.row])"
        return cell
    }
}
