//
//  UpdateTimeListViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class UpdateTimeListViewController: UIViewController {
    
    @IBOutlet var updateTimeListTableView: UITableView!
    var tempData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func presentUpdateTimeAddView() {
        guard let updateTimeAddController = self.storyboard?.instantiateViewController(withIdentifier: "UpdateTimeAddController") as? UpdateTimeAddController else {
            return
        }
        updateTimeAddController.updateTimeListController = self
        self.present(updateTimeAddController, animated: true, completion: nil)
    }
    
}

extension UpdateTimeListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UpdateTimeCell") as! UpdateTimeCell
        cell.timeLabel.text = "\(tempData[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            tempData.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
