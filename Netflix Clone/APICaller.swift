//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

//import Foundation
//
//struct Contents{
//    static let API_KEY = "025a0d7f62fd8db82c410f6dad7059bd"
//    static let baseURL = "https://api.themoviedb.org/"
//}
//
//class APICaller{
//    static let shared = APICaller()
//    
//    
//    func getTrendingMovies(completion: @escaping (String) -> Void){
//        
//        
//        guard let url = URL(string: "\(Contents.baseURL)3/trending/movie/day?api_key=\(Contents.API_KEY)")else{ return }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
//            guard let data = data , error == nil else { return }
//            
//            do{
//                let results = try JSONDecoder().decode(trendingMovieResponse.self, from: data)
//                print(results.results)
//            }catch{
//                print(error.localizedDescription)
//                
//            }
//        }
//        
//        task.resume()
//    }
//    
//    
//    func getTrendingTVs(completion: @escaping (String) -> Void){
//        
//        
//        guard let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=\(Contents.API_KEY)")else{
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data,_,error in
//            guard let data = data , error == nil else { return }
//            
//            
//            do{
//                let results = try JSONDecoder().decode(trendingTvResponse.self, from: data)
//                print(results.results)
//            }catch{
//                print(error.localizedDescription)
//                
//            }
//        }
//        
//        task.resume()
//    }
//}
