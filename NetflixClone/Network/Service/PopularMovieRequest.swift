//
//  PopularMovieRequest.swift
//  SwiftUI-MVVM
//
//  Created by Yusuke Kita on 6/9/19.
//  Copyright © 2019 Yusuke Kita. All rights reserved.
//

import Foundation
import SwiftUI

struct PopularMovieRequest: APIRequestType {
    typealias Response = PopularMovies
    
    var path: String { return "movie/popular" }
    var queryItems: [URLQueryItem]?
}
