////
////  share.swift
////  soccer
////
////  Created by User05 on 2022/12/30.
////
//
//import Foundation
//import SwiftUI
//import WebKit
//
//struct share: UIViewControllerRepresentable {
//    typealias UIViewControllerType = WKWebView
//
//    func makeUIViewController(context: Context) -> WKWebView {
//
//        let webView = WKWebView()
//        if let url = URL(string: "https://www.thelittleprince.com") {
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
//        return webView
//    }
//
//    func updateUIViewController(_ uiView: WKWebView, context: Context) {
//
//    }
//
//
//}
//struct Previews_WebView_Previews: PreviewProvider {
//    static var previews: some View {
//        share()
//    }
//}
