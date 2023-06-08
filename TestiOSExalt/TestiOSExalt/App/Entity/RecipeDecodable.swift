//
//  RecipeDecodable.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation

struct RecipeDecodable: Decodable {
    let id: Int?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
