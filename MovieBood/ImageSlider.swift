//
//  ImageSlider.swift
//  MovieBood
//
//  Created by YILDIRIM on 1.04.2023.
//

import SwiftUI

struct ImageSlider: View {
    
    var body: some View {
        
        TabView {
            ForEach(0..<5){_ in
                TestImage()
            }
            
            
        }
        .ignoresSafeArea()
        .frame(height: 550)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .onAppear(perform: {
            UIPageControl.appearance().currentPageIndicatorTintColor = .systemYellow
            UIPageControl.appearance().pageIndicatorTintColor = UIColor.yellow.withAlphaComponent(0.2)
        })
        
    }
    
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider()
    }
}

struct TestImage: View {
    
    var body: some View {
        Image("star-wars-banner")
            .resizable()
            .frame(height: 550)
            .scaledToFit()
    }
}
