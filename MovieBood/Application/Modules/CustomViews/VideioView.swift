//
//  VideioView.swift
//  MovieBood
//
//  Created by YILDIRIM on 10.04.2023.
//
import WebKit

import SwiftUI

struct VideoView : UIViewRepresentable{
    
    let youtubeURL: URL?
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = youtubeURL else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
}
