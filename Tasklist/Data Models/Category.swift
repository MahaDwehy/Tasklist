//
//  Category.swift
//  Tasklist
//
//  Created by Maha AlDwehy on 09/10/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}


