//
//  PokemonPageView.swift
//  PokemonApp
//
//  Created by Horacio Mota on 14/09/2023.
//

import SwiftUI
import SwiftUICharts

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
                
                Spacer()
                
                HStack(spacing: 8) {
                    Image(systemName: "heart.fill")
                    Text("HP: \(pokemon.stats.HP)")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Image(systemName: "target")
                    Text("Attack: \(pokemon.stats.Attack)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 16)

                HStack(spacing: 8) {
                    Image(systemName: "shield.fill")
                    Text("Defense: \(pokemon.stats.Defense)")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()

                    Image(systemName: "figure.run")
                    Text("Speed: \(pokemon.stats.Speed)")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                Spacer()

            }
            
        
                Divider()

            }.navigationTitle ("\(pokemon.name) #\(pokemon.id)")
        }.padding(.horizontal)
        
    }
}

func formatTypes(_ types: [String]) -> String {
    return types.joined(separator: ", ")
}

