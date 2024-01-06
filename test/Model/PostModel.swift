//
//  PostModel.swift
//  test
//
//  Created by ahmed samir on 06/01/2024.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
