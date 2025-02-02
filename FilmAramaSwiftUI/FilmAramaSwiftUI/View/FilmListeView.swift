//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Ahmet Hakan Asaroğlu on 31.01.2025.
//

import SwiftUI

struct FilmListeView: View {
    @ObservedObject var filmListeViewModel: FilmListeViewModel  // FilmViewModel'daki gözlemlenebilir objeyi gözlemliyoruz.
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Aranacak Film", text: $aranacakFilm) {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)  // boslukları ve yeni satırları trim et, hata cıkmaz böylece
                }.padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(filmListeViewModel.filmler, id: \.imdbId) { film in
                    NavigationLink {
                        DetayView(imdbId: film.imdbId)
                    } label: {
                        HStack{
                            OzelImage(url: film.poster)
                                .frame(width: 90, height: 130)
                            
                            VStack(alignment: .leading) {
                                Text(film.title)
                                    .font(.title3)
                                    .foregroundColor(.blue)
                                
                                Text(film.year)
                                    .foregroundColor(.orange)
                                
                            }
                        }
                    }

                    
                }.navigationTitle("Film Kitabı")
            }
        }
    }
}

#Preview {
    FilmListeView()
}
