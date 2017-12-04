//
//  MoviesService.swift
//  Muvy
//
//  Created by Arilson Carmo on 12/3/17.
//  Copyright © 2017 Arilson Carmo. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieServices {
    
    static func getFeaturedMovies(page: Int, completionBlock: @escaping ([Movies], NSError?) -> () ) {
        let url = URL(string: APIInfo.url + "discover/movie")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        let postString = "api_key="+APIInfo.api_key+"&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=" + String(page)
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        Alamofire.request(request).responseObject { (response: DataResponse<Result>) in
            switch response.result {
            case .failure(let err):
                print(err)
                completionBlock([], err as NSError?)
            case .success:
                completionBlock(response.result.value!.results, nil)
            }
        }
    }
}
