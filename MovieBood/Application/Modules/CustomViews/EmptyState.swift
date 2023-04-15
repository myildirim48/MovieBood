//
//  EmptyState.swift
//  MovieBood
//
//  Created by YILDIRIM on 15.04.2023.
//

import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack(spacing: 30){
            
            Text("Oppss...")
                .foregroundColor(.white)
                .font(.system(size: 35))
                .fontWeight(.semibold)
            
            Image("default-movie")
                .resizable()
                .opacity(0.5)
                .frame(width: 150, height: 200)
                
            Text("There is no film...")
                .foregroundColor(.white)
                .font(.system(size: 24))
                .fontWeight(.medium)
            
        }.padding(.bottom,100)
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
