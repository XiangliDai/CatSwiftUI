//
//  ErrorView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var breedManager:BreedManager
    var body: some View {
        VStack{
            Text("😿")
                .font(.system(size: 80))
            Text(breedManager.errorMessage ?? "")
            Button {
                breedManager.fetchAllBreeds()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(breedManager: BreedManager())
    }
}
