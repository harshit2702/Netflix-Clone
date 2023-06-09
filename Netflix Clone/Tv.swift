//
//  Tv.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

import Foundation

struct Tv: Codable,Hashable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_language: String?
    let poster_path: String?
    let first_air_date: String?
    let name: String
    let vote_count: Int
    let popularity: Double?
    let origin_country: [String]?
}

struct trendingTvResponse: Codable{
    let results: [Tv]
}
