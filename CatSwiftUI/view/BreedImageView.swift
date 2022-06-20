//
//  BreedImageView.swift
//  CatSwiftUI
//
//  Created by Xiangli on 6/20/22.
//

import SwiftUI

struct BreedImageView: View {
    let breed:Breed
    let imageSize: CGFloat
    var body: some View {
        if breed.image?.url != nil {
            AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                if let image = phase.image{
                    image.resizable()
                        .scaledToFill()
                        .frame(width: imageSize, height: imageSize)
                        .clipped()
                } else if phase.error != nil {
                    Text(phase.error?.localizedDescription ?? "error")
                        .foregroundColor(Color.red)
                        .frame(width: imageSize, height: imageSize)
                } else {
                    ProgressView()
                        .frame(width: imageSize, height: imageSize)
                }
            }
        } else {
            ZStack{
                Color.gray.frame(width: imageSize, height: imageSize)
                Text("no image")
                    .font(.system(size: 20))
            }
        }
    }
}

struct BreedImageView_Previews: PreviewProvider {
    static var previews: some View {
        BreedImageView(breed: Breed.example2(), imageSize: 300)
    }
}
