//
//  RealmModel.swift
//  Unspalsh
//
//  Created by user1 on 16/10/22.
//

import RealmSwift
import Realm

class PhotoDm: Object {
    @objc dynamic var img : String?
    @objc dynamic var name : String?
    @objc dynamic var addres :String?
    @objc dynamic var createAt: String?
    @objc dynamic var dowloads: String?
    @objc dynamic var _id : String?

    override class func primaryKey() -> String? {
        "_id"
    }
}
