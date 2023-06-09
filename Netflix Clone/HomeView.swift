//
//  HomeView.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

import SwiftUI

struct HomeView: View {
    let values = ["😂","💩","👍","🙈","🥺","♥️"]
    
    @State private var results = [Movie]()
    @State private var results_tv = [Tv]()
    @State private var results_popular = [Movie]()
    @State private var results_upcoming = [Movie]()
    @State private var results_topRated = [Movie]()

    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading){
                ZStack {
                    Image("HeaderImage")
                        .resizable()
                        .scaledToFill()
                        .overlay{
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color.black.opacity(0.6),
                                        Color.clear
                                    ]
                                ),
                                startPoint: .bottom,
                                endPoint: .center
                            )
                        }
                    .frame(height: 450)
                    VStack{
                        HStack{
                            Text("N") //NetFlix Logo
                                .fontWeight(.bold)
                                .foregroundColor(.red)
                                .font(.largeTitle)
                                .padding()
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Button{
                                //Play
                            }label: {
                                Image(systemName: "play.circle")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                            Spacer()
                            Button{
                                //Download
                            }label: {
                                Image(systemName: "square.and.arrow.down.fill")
                                    .font(.headline)
                            }
                        }
                        .padding()
                        
                    }
                }
                Spacer()
                Rectangle()
                    .frame(height: 01)
                Section("  Trending Movies  "){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(results, id: \.self){movie in
                                CardView(Original_title: movie.title, release_date: movie.release_date!,poster_page: movie.poster_path)
                            }
                            
                        }
                    }
                }
                Section("  Trending TV  ") {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(results_tv, id: \.self){Tv in
                                CardView(Original_title: Tv.name, release_date: Tv.first_air_date,poster_page: Tv.poster_path)
                                    .font(.largeTitle)
                            }
                        }
                    }
                }
                Section("  Popular  ") {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(results_popular, id: \.self){movie in
                                CardView(Original_title: movie.title, release_date: movie.release_date!,poster_page: movie.poster_path)
                            }
                            
                        }
                    }
                }
                Section("  Upcoming Movies  ") {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(results_upcoming, id: \.self){movie in
                                CardView(Original_title: movie.title, release_date: movie.release_date!,poster_page: movie.poster_path)
                            }
                        }
                    }
                }
                Section("  Top Rated  ") {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(results_topRated, id: \.self){movie in
                                CardView(Original_title: movie.title, release_date: movie.release_date!,poster_page: movie.poster_path)
                            }
                        }
                    }
                }
            }
            .font(.system(size: 18, weight: .bold))

        }
        .edgesIgnoringSafeArea([.top,.horizontal])
        .task {
            await loadTrendingMovie()
            await loadTrendingTV()
            await loadPopularMovie()
            await loadUpcomingMovie()
            await loadTopRatedMovie()
        }
    }
    
    func loadTrendingMovie() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=025a0d7f62fd8db82c410f6dad7059bd") else { return }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(trendingMovieResponse.self, from: data){
                results = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
    
    func loadTrendingTV() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=025a0d7f62fd8db82c410f6dad7059bd") else { return }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(trendingTvResponse.self, from: data){
                results_tv = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
    func loadPopularMovie() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=025a0d7f62fd8db82c410f6dad7059bd&page=1") else { return }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(trendingTitleResponse.self, from: data){
                results_popular = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
    func loadUpcomingMovie() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=025a0d7f62fd8db82c410f6dad7059bd&page=1") else { return }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(upcomingMovieResponse.self, from: data){
                results_upcoming = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
    
    func loadTopRatedMovie() async {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=025a0d7f62fd8db82c410f6dad7059bd&page=1") else { return }
        
        do{
            let (data,_) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(upcomingMovieResponse.self, from: data){
                results_topRated = decodedResponse.results
            }
        }catch{
            print("invalid data")
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
