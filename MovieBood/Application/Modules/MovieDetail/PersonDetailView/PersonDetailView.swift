//
//  PersonDetailView.swift
//  MovieBood
//
//  Created by YILDIRIM on 7.04.2023.
//

import SwiftUI

struct PersonDetailView: View {
    let personID: Int
    
    @ObservedObject private var viewModel = PersonDetailViewModel()
    @State private var isExpanded: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                
                    LoadableImage(url: viewModel.person.ptofileImageUI, defaultImage: .movie)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .init(white: 0.5, opacity: 0.5), radius: 10)
                        .frame(width: 350, height: 350)
                    
                
                Text(viewModel.person.name ?? "n / a")
                    .foregroundColor(.white)
                    .font(.title)
                    .fontWeight(.bold)
//                    .frame(width: 250,alignment: .leading)
                Text(viewModel.person.knownForDepartment ?? "Unknown department")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
            }
                HStack {
                        InfoView(infoType: "Birthday", value: viewModel.person.birthdayUI ,size: 18)
                    Spacer(minLength: 50)
                        InfoView(infoType: "Place of birth ", value: viewModel.person.placeOfBirth ,size: 18)
                    
                }.padding()
                
            VStack{
                Text(viewModel.person.biography ?? "")
                    .padding(.bottom, 14)
                    .foregroundColor(.white)
                     .lineLimit(isExpanded ? nil : 5)
                     
                     .overlay(
                         GeometryReader { proxy in
                             Button(action: {
                                 isExpanded.toggle()
                             }) {
                                 Text(isExpanded ? "Less" : "Read More")
                                     .underline()
                                     .foregroundColor(.white)
                                     .background(Color.black)
                                     .font(.caption).bold()
                             }
                             .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                         }
                     )
            }.padding()

            
            
        }
        .onAppear{
            viewModel.fetchPerson(personID: personID)
        }
        .background(.black)
        .navigationTitle(viewModel.person.name ?? "Name")
        

    }
}

struct PersonDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PersonDetailView(personID: 123)
    }
}
