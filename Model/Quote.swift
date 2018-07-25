//
//  Quote.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 6..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import RealmSwift
import Realm
import ObjectMapper

class Quote: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var quote: String = ""
    @objc dynamic var person: String = ""
    @objc dynamic var category: Category?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.quote      <- map["quote"]
        self.person     <- map["person"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func incrementID() -> Int {
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Config.GroupID)!
        let fileURL = directory.appendingPathComponent(Config.DatabaseName)
        let realm = try! Realm(fileURL: fileURL)
        return (realm.objects(Quote.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
    static func random() -> Quote? {
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: Config.GroupID)!
        let fileURL = directory.appendingPathComponent(Config.DatabaseName)
        let realm = try! Realm(fileURL: fileURL)
        
        let quotes = realm.objects(Quote.self)
        if quotes.count == 0 {
            return nil
        }
        
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }

}
