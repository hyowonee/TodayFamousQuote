//
//  Category.swift
//  TodayQuotes
//
//  Created by Hyowon Choi on 2018. 7. 15..
//  Copyright © 2018년 Hyowonee. All rights reserved.
//

import RealmSwift
import Realm
import ObjectMapper

class Category: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.name   <- map["name"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func incrementID() -> Int {
        let directory: URL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.Hyowonee.Quotes")!
        let fileURL = directory.appendingPathComponent("db.realm")
        let realm = try! Realm(fileURL: fileURL)
        return (realm.objects(Category.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
    
}
