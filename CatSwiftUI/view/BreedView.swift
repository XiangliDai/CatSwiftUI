//
//  BreedView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import SwiftUI

struct BreedView: View {
    let breed:Breed
    let imageSize: CGFloat
    var body: some View {
        HStack{
            BreedImageView(breed: breed, imageSize: imageSize)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
                
            }
        }
    }
}

struct BreedView_Previews: PreviewProvider {
    static var previews: some View {
        BreedView(breed: Breed.example2(), imageSize: 100)
    }
}
