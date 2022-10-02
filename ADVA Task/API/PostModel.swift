//
//  PostModel.swift
//  ADVA Task
//
//  Created by mohamed dorgham on 01/10/2022.
//

import Foundation

// MARK: - PostsResponse
struct PostsResponse: Decodable {
    var data: [Post]?
    var total, page, limit: Int?
}

// MARK: - Post
struct Post: Decodable, Identifiable {
    var id: String?
    var image: String?
    var likes: Int?
    var tags: [String]?
    var text, publishDate: String?
    var owner: Owner?
}

// MARK: - Owner
struct Owner: Decodable {
    var id, title, firstName, lastName: String?
    var picture: String?
}
