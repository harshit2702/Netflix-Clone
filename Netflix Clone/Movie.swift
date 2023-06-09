//
//  Movie.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

import Foundation


struct Movie: Codable,Hashable {
    let id: Int
    let media_type: String?
    let original_title: String?
    let original_language: String?
    let poster_path: String?
    let release_date: String?
    let title: String
    let vote_count: Int
    let popularity: Double?
}

struct trendingMovieResponse: Codable{
    let results: [Movie]
}

struct trendingTitleResponse: Codable {
    let results: [Movie]
}

struct upcomingMovieResponse: Codable{
    let results: [Movie]
}

struct topRaterMovieResponse: Codable{
    let results: [Movie]
}
