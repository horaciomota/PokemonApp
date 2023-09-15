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
        NavigationLink {
            PokemonPageView(pokemon: pokemon)
        } label: {
            HStack (alignment: .center) {
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
                
                //Toda vez que eu fizer uma chamada Async eu aparentemente tenho que usar o else caso contrario a api buga
            
            AsyncImage(url: URL(string: pokemon.imageUrl)) { pokemonImage in
                if let image = pokemonImage.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 222)
                }else {
                    Rectangle()
                        .scaledToFit()
                        .frame(height: 222)
                        .background(Color.white)
                    
                }
                                
            }
                Divider()

        }
        }

            
            

    }
}
