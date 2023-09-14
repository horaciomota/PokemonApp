//
//  PokemonDetailview.swift
//  PokemonApp
//
//  Created by Horacio Mota on 14/09/2023.
//

import SwiftUI


struct PokemonDetailView: View {
    
    var pokemon: ContentView.PokemonModel
    
    var body: some View {
            HStack (alignment: .top) {
            VStack(alignment: .leading) {
                Text(pokemon.name)
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                
                Text(pokemon.description)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            
            AsyncImage(url: URL(string: pokemon.imageUrl)) { pokemonImage in
                if let image = pokemonImage.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 222)
                }
                                
            }
                Divider()

        }
            

    }
}
