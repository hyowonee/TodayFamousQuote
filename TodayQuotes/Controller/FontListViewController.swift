//
//  FontListViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class FontListViewController: UIViewController {

    @IBOutlet var fontListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension FontListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontCell") as! FontCell
        return cell
    }
}
