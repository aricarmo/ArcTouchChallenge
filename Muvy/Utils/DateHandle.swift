//
//  DateHandle.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/3/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import Foundation

class DateHandle {
    
    static func formatDate(_ dateString: String) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        let dateFormatted = dateFormater.date(from: dateString)!
        dateFormater.dateFormat = "dd/MM/yyyy"
        dateFormater.locale = Locale.init(identifier: "pt_BR")
        return dateFormater.string(from: dateFormatted).capitalized
    }
}
