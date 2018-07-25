//
//  TodayViewController.swift
//  Quotes
//
//  Created by Hyowon Choi on 2018. 7. 11..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit
import NotificationCenter
import RealmSwift

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet var quoteLabel: UILabel!
    @IBOutlet var widgetImageView: UIImageView!
    
    let shareDefaults = UserDefaults(suiteName: "group.Hyowonee.Quotes")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 디비에서 이미지 설정
//        widgetImageView.image =
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        if let quote = Quote.random() {
            self.quoteLabel.text = "\(quote.quote) - \(quote.person), \(quote.category!.name)"
            shareDefaults!.set(self.quoteLabel.text, forKey:"quoteText")
        }
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func openApp(_ sender: AnyObject) {
        let url: URL? = URL(string: "Quotes:")!
        
        if let appurl = url {
            self.extensionContext!.open(appurl, completionHandler: nil)
        }
    }
}
