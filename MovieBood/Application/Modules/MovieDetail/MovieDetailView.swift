//
//  MovieDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

struct MovieDetailView: View {
    var body: some View {
        ScrollView {
            VStack{
                LoadableImage(url: URL(string: "https://image.tmdb.org/t/p/w500/9mnXOxmkZSQCHjprx47CnamBEOk.jpg"))
                    .shadow(color: .init(white: 1.0, opacity: 0.5), radius: 10)

                HStack{
                    VStack(alignment: .leading) {
                        Text("İngiliz Kemal")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("★★★★")
                            .foregroundColor(.yellow)
                        Text("4 / 5")
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.padding(.leading,50)
                
            }.frame(width: 450, height: 550)
   
        }
            .background(.black)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
