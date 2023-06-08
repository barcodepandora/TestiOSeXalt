//
//  Recipe.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation

enum Recipe {
    struct Request {
        var id: Int
    }
    
    struct Response {
        var id: Int
        var name: String
    }
    
    struct ViewModel {
        var id: Int
        var name: String
    }
}
