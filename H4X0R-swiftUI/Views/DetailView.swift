//
//  DetailView.swift
//  H4X0R-swiftUI
//
//  Created by Karan Aggarwal on 04/01/21.
//

import SwiftUI
import WebKit
struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}


