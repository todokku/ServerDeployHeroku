//
//  User.swift
//  App
//
//  Created by Артем Стратиенко on 22.03.2020.
//

import FluentPostgreSQL
import Vapor
// Allows `User` to be used as a dynamic migration.
final class User: PostgreSQLModel {
    var id: Int?
    var username: String
    init(id: Int? = nil, username: String) {
        self.id = id
        self.username = username
    }
}
extension User: Content {}
extension User: Migration {}
extension User : Parameter {}
