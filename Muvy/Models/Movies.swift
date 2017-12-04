//
//  Movies.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/3/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import Foundation
import ObjectMapper

class Result: Mappable {
    var page:Int = 0
    var total_results:Int = 0
    var total_pages: Int = 0
    var results:[Movies] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        total_results <- map["total_results"]
        total_pages <- map["total_pages"]
        results <- map["results"]
    }
}

class Movies: Mappable {
    
    var title:String = ""
    var poster_path:String = ""
    var release_date: String = ""
    var backdrop_path: String = ""
    var vote_average: Double = 0
    var overview: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        backdrop_path <- map["backdrop_path"]
        vote_average <- map["vote_average"]
        overview <- map["overview"]
    }
    
}
