//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Ahmet Hakan Asaroğlu on 2.02.2025.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId: String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {
        VStack {
            
            OzelImage(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
            VStack(alignment: .leading, spacing: 5) {
                
                Text(filmDetayViewModel.filmDetayi?.title ?? "Film İsmi Gösterilecek")
                    .padding()
                    .font(.title)
                    .foregroundColor(.blue)
                
                Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plotu Gösterilecek").padding()
                
                Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen Gösterilecek")").padding()
                
                Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar Gösterilecek")").padding()
                
                Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödüller Gösterilecek")").padding()
                
                Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl Gösterilecek")").padding()
            }
            
        }.onAppear {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId) // gösterildiginde alınacak aksiyonu gösterir.
        }
    }
}
    
    #Preview {
        DetayView(imdbId: "test")
    }

