//
//  LicenseListViewController.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit

class LicenseListViewController: UIViewController {

    @IBOutlet var licenseListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LicenseListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LicenseCell") as! LicenseCell
        return cell
    }
}
