//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by Project Xcode Templates
//  Created by Wahyu Ady Prasetyo,
//

import Foundation

extension Int {
    /// Change integer data type into string format decimal
    var asDecimal: String {
        let formatter = NumberFormatter()
        formatter.locale = LocalizeHelper.shared.locale
        formatter.numberStyle = .decimal
        let string = formatter.string(from: NSNumber(integerLiteral: self))
        return string!
    }
    
    /// Change integer into boolean data type
    var toBool: Bool {
        return Bool(truncating: NSNumber(value: self))
    }
}

extension Int64 {
    /// Change integer64 data type into string format decimal
    var asDecimal: String {
        let formatter = NumberFormatter()
        formatter.locale = LocalizeHelper.shared.locale
        formatter.numberStyle = .decimal
        let string = formatter.string(from: NSNumber(value: self))
        return string!
    }
}