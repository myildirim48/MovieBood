//
//  MovelistView.swift
//  MovieBood
//
//  Created by YILDIRIM on 31.03.2023.
//

import SwiftUI

struct MovelistView: View {
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    
                    NavigationLink {
                        MovieDetailView()
                    } label: {
                        ImageSlider()
                    }

                    
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Star Wars")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .font(.system(size: 40))
                                HStack {
                                    Text("★★★★★")
                                        .foregroundColor(.yellow)
                                    Text("4.8")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20))
                                
                                }
                                HStack {
                                    Text("Action")
                                        .foregroundColor(.white)
                                    Text("2hr 30min")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding(.leading,20)
                            Spacer()
                        }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Drama")
                            .font(.custom("PlayfairDisplay-Bold", size: 32))
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .padding(.top,30)
                        
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack (spacing: 0) {
                                ForEach(0 ..< 12) { i in
                                    NavigationLink(
                                        destination: MovieDetailView(),
                                        label: {
                                            MovieCardView(image: Image("star-wars-banner"),filmName: "Star Wars")
                                        })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.leading)
                            }
                        }
                        .padding(.bottom, 30)
                    }
                    

                    }
            }
            .padding(.bottom, 60)
            .ignoresSafeArea()
        .background(.black)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovelistView()
    }
}

struct MovieCardView: View {
    let image: Image
    let size: CGFloat = 250
    let filmName: String
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size - 30, height: size + 30)
                .cornerRadius(8.0)
            
            HStack {
                Text(filmName).font(.title).fontWeight(.bold)
                    .foregroundColor(.white)
                Spacer()
            }
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Text("★")
                        .foregroundColor(.yellow)
                }
                Spacer()
                Text("Action")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
        .frame(width: size - 45)
        .padding(15)
        .background(Color.secondary)
        .cornerRadius(8)
        
    }
}
