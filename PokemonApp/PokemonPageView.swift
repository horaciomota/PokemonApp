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
        
        VStack {
            
            AsyncImage(url: URL(string: pokemon.imageUrl)) { pokemonImage in
                if let image = pokemonImage.image {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 322)
                }
                                
            }
            
            HStack (alignment: .top) {
                
            VStack(alignment: .leading) {
                Text((formatTypes(pokemon.types)))
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)

                
                Text("Description:")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.bottom, 2 )
                
                Text(pokemon.description)
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
    
            }
            
        
                Divider()

            }.navigationTitle ("\(pokemon.name) #\(pokemon.id)")
        }.padding(.horizontal)
        
    }
}

func formatTypes(_ types: [String]) -> String {
    return types.joined(separator: ", ")
}

struct PokemonPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView(){
            PokemonPageView(pokemon: ContentView.PokemonModel(id: 1, name: "", description: "", imageUrl: "", types: ["Grass"]))
        }
    }
}
