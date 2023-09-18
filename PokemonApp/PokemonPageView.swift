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
                
                HStack {
                                BarChartView(data: ChartData(values: [
                                    ("HP", Double(pokemon.stats.HP)),
                                    ("Ataque", Double(pokemon.stats.Attack)),
                                    ("Defesa", Double(pokemon.stats.Defense)),
                                    ("Velocidade", Double(pokemon.stats.Speed))
                                ]), title: "s")
                                .frame(height: 200) // Ajuste a altura conforme necessário
                            }
                
//                ("HP", Double(pokemon.stats.HP)),
//                ("Ataque", Double(pokemon.stats.Attack)),
//                ("Defesa", Double(pokemon.stats.Defense)),
//                ("Velocidade", Double(pokemon.stats.Speed))
//
            }
            
        
                Divider()

            }.navigationTitle ("\(pokemon.name) #\(pokemon.id)")
        }.padding(.horizontal)
        
    }
}

func formatTypes(_ types: [String]) -> String {
    return types.joined(separator: ", ")
}

