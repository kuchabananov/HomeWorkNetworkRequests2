//
//  User.swift
//  NetworkRequests
//
//  Created by Евгений on 26.07.21.
//

import Foundation


struct User: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
    let phone: String?
    let website: String?
    let address: Address?
    let company: Company?
}

// MARK: - Address

struct Address: Codable {
    let street: String?
    let suite: String?
    let city: String?
    let zipcode: String?
    let geo: Geo?
}

// MARK: - Company

struct Company: Codable {
    let name: String?
    let catchPhrase: String?
    let bs: String?
}

// MARK: - Geo

struct Geo: Codable {
    let lat: String?
    let lng: String?
}
