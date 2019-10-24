//
//  UserModel.swift
//  sidebar
//
//  Created by Konstantin Igorevich on 24.10.2019.
//  Copyright © 2019 Konstantin Igorevich. All rights reserved.
//
//   let userModel = try? JSONDecoder().decode(UserModel.self, from: jsonData)

typealias UserModel = [UserModelElement]

// MARK: - UserModelElement
struct UserModelElement: Codable {
    let itemId: String?
    let name: String?
    let image: String?
    let userModelDescription: String?
    let time: String?

    enum CodingKeys: String, CodingKey {
        case itemId = "itemId"
        case name = "name"
        case image = "image"
        case userModelDescription = "description"
        case time = "time"
    }
}
