# Pokedex SwiftUI

A SwiftUI Pokédex app built to practice modern iOS architecture, networking, state management, pagination, and testability.

This project uses the public [PokéAPI](https://pokeapi.co/) to fetch Pokémon, display them in a searchable list, support infinite scrolling, and show a detail screen with additional Pokémon information.

## Overview

The goal of this project was to build a clean SwiftUI app while reinforcing production-style iOS patterns:

- MVVM architecture
- SwiftUI `List` with reusable row views
- Modern Observation using `@Observable`
- async/await networking with `URLSession`
- Protocol-based dependency injection
- Pagination / infinite scrolling
- Search with `.searchable`
- JSON decoding with `Decodable`
- Basic unit tests for models and view model behavior


## Features

- Fetches Pokémon from the PokéAPI
- Displays Pokémon in a SwiftUI `List`
- Custom row views with sprite images
- Detail screen for each Pokémon
- Searchable list using `.searchable`
- Infinite scrolling with paginated API requests
- Loading states for initial load and pagination
- Error handling for failed network requests
- Protocol-based API client for easier testing
- Unit tests using Swift Testing

## Architecture

The app follows a lightweight MVVM structure.

```text
Pokedex_SwiftUI
├── Models
│   └── Pokemon.swift
├── Networking
│   ├── PokemonAPIClient.swift
│   ├── PokemonAPIClientProtocol.swift
│   ├── PokemonListResponse.swift
│   └── PokemonDetailResponse.swift
├── ViewModels
│   ├── PokemonListViewModel.swift
│   └── PokemonDetailViewModel.swift
├── Views
│   ├── ContentView.swift
│   ├── PokemonRowView.swift
│   └── PokemonDetailView.swift
└── Tests
```
## Screenshots
<img width="1206" height="2622" alt="Simulator Screenshot - iPhone 17 Pro - 2026-07-17 at 11 54 24" src="https://github.com/user-attachments/assets/3ea52ce8-b08f-4af6-a4fc-117392c47978" />

