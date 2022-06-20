//
//  ContentView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedManager = BreedManager(service: APIService())
    var body: some View {
        if breedManager.isLoading {
            LoadingView()
        } else if breedManager.errorMessage != nil {
            ErrorView(breedManager: breedManager)
        } else {
            BreedListView(breeds: breedManager.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
