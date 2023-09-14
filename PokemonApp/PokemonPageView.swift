//
//  PokemonPageView.swift
//  PokemonApp
//
//  Created by Horacio Mota on 14/09/2023.
//

import SwiftUI

struct PokemonPageView: View {
    
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

        }.navigationTitle(pokemon.name)
        
    }
}

struct PokemonPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            PokemonPageView(pokemon: ContentView.PokemonModel(id: 1, name: "Bulbasaur", description: "Lorem Ipsum", imageUrl: "https://pub-460ada4f152c4135a7ec0881a2cb1330.r2.dev/2.webp"))
        }
    }
}
