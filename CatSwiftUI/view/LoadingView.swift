//
//  LoadingView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing:20){
            Text("😸")
                .font(.system(size: 80))
            ProgressView()
            Text("Getting cat breeds...")
                .foregroundColor(.gray)

        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
