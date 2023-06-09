//
//  CardView.swift
//  Netflix Clone
//
//  Created by Harshit Agarwal on 06/06/23.
//

import SwiftUI

struct CardView: View {
    @State var Original_title: String
    @State var release_date: String?
    @State var poster_page: String?
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                
                if(poster_page != nil){
                    
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w300_and_h450_bestv2\(poster_page!)"), scale: 1){image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }
                
            }
            .frame(width: 150,height: 225)
            VStack{
                HStack {
                    Text(Original_title)
                        .font(.subheadline)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text(release_date!)
                        .fontWeight(.bold)
                        .font(.caption)
                    Spacer()
                }
            }
            .frame(width: 150,height: 60)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(Original_title: "Hello", release_date: "07-08-2023")
    }
}
