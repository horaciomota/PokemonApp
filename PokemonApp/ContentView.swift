//
//  ContentView.swift
//  PokemonApp
//
//  Created by Horacio Mota on 14/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var pokemonList: [PokemonModel] = []
    
    var body: some View {
        List(pokemonList, id: \.id) { pokemon in
            Text(pokemon.name)
        }
        .task {
            do {
                pokemonList = try await fetchPokemons()
            } catch {
                print("Error \(error)")
            }
        }
    }
}


struct PokemonModel: Decodable {
    let id: Int
    let name: String
}

func fetchPokemons() async throws -> [PokemonModel] {
    guard let url = URL(string: "https://pokeapi.deno.dev/pokemon") else {
        print("Something went wrong with your URL")
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    print("Fetching data...")
    
    let result = try JSONDecoder().decode([PokemonModel].self, from: data)
    return result
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
