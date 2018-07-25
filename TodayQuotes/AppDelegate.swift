//
//  AppDelegate.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 6..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import UIKit
import RealmSwift
import ObjectMapper

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Config.GroupID)!
        let fileURL = directory.appendingPathComponent(Config.DatabaseName)
        let realm = try! Realm(fileURL: fileURL)
        
        let hasLaunchedKey = "HasLaunched"
        let defaults = UserDefaults.standard
        if !defaults.bool(forKey: hasLaunchedKey) { // hasLaunchedKey 속성이 false일 경우에만 실행
            if let path = Bundle.main.path(forResource: "categories", ofType: "json") {
                let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:Any]] {
                    for item in jsonResult {
                        if let category = Mapper<Category>().map(JSON: item) {
                            category.id = Category.incrementID()
                            try! realm.write {
                                realm.add(category)
                            }
                        }
                    }
                }
            }
            
            if let path = Bundle.main.path(forResource: "quotes", ofType: "json") {
                let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let jsonResult = try! JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [[String:Any]] {
                    // var string = "{name:\"Sunhyoup\"}"
                    // var json: [String:Any] = BlaBla.toJSON(string)
                    for item in jsonResult {
                        if let quote = Mapper<Quote>().map(JSON: item) {
                            let categoryId = item["category_id"] as! Int
                            let category = realm.object(ofType: Category.self, forPrimaryKey: categoryId)
                            quote.id = Quote.incrementID()
                            quote.category = category
                            try! realm.write {
                                realm.add(quote)
                            }
                        }
                    }
                }
            }

            defaults.set(true, forKey: hasLaunchedKey) // 최초 한 번만 실행되도록 hasLaunchedKey 속성을 true로 변경
        }
        
        print(realm.objects(Quote.self))
        
        return true
    }

}
