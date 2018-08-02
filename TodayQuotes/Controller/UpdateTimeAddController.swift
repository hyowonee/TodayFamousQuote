//
//  UpdateTimeAddController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 26..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class UpdateTimeAddController: UIViewController {
    
    @IBOutlet var datePicker: UIDatePicker!
    
    var date: String = ""
    
    var updateTimeListController: UpdateTimeListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        date = dateFormatter.string(from: datePicker.date)
        print("date is........" + date)
        self.updateTimeListController?.tempData.append(date)
        self.updateTimeListController?.updateTimeListTableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
