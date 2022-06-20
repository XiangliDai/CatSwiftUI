//
//  BreedDetailView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/19/22.
//

import SwiftUI

struct BreedDetailView: View {
    let breed: Breed
    let imageSize: CGFloat
    var body: some View {
        VStack{
            BreedImageView(breed: breed, imageSize: imageSize)
            VStack(alignment: .leading, spacing: 15) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
                    .font(.footnote)
                Text(breed.breedExplaination)
                if breed.isHairless {
                    Text("hairless")
                }
                                   
               HStack {
                   Text("Energy level")
                   Spacer()
                   ForEach(1..<6) { id in
                       Image(systemName: "star.fill")
                           .foregroundColor(breed.energyLevel > id ? Color.accentColor : Color.gray )
                   }
               }
               
               Spacer()
           }.padding()
               .navigationBarTitleDisplayMode(.inline)
            
            }
        }
    }


struct BreedDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BreedDetailView(breed: Breed.example2(), imageSize: 300)
    }
}
