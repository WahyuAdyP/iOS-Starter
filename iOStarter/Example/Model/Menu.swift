//
//  Menu.swift
//  iOStarter
//
//  Created by Crocodic MBP-2 on 24/07/18.
//  Copyright © 2018 WahyuAdyP. All rights reserved.
//

import Foundation

class Menu {
    /// Type of menu
    ///
    /// - profile: Profile user menu 
    /// - logout: Logout menu
    enum MenuType: Int {
        case home = 0
        case exampleContent = 1
        case profile = 3
        case logout = 4
    }
    
    var type: MenuType
    var id: Int {
        return type.rawValue
    }
    var name: String
    var image: String
    
    init() {
        self.type = .profile
        self.name = ""
        self.image = ""
    }
    
    init(type: MenuType, name: String, image: String) {
        self.type = type
        self.name = name
        self.image = image
    }
}
