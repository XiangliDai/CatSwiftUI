//
//  BreedListView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import SwiftUI

struct BreedListView: View {
    @State private var searchText: String = ""
    let breeds:[Breed]
    
    var filteredBreeds:[Breed] {
        if searchText.count == 0 {
            	return breeds
        } else {
            return breeds.filter { $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredBreeds){ breed in
                    NavigationLink {
                        BreedDetailView(breed: breed, imageSize: 300)
                    } label: {
                        BreedView(breed: breed, imageSize: 100)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Find your cat breed")
            .searchable(text: $searchText)
        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView(breeds: [Breed.example1(), Breed.example2()])
    }
}
