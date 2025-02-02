//
//  FilmViewModel.swift
//  FilmAramaSwiftUI
//
//  Created by Ahmet Hakan Asaroğlu on 1.02.2025.
//

import Foundation
import SwiftUI

class FilmListeViewModel: ObservableObject {   // yayın durumuna sokabiliyorum. aşağıda filmleri yayın durumuna sokucaz.
 
    @Published var filmler = [FilmViewModel]()   // filmler degiskenini gözlemletmek istiyoruz degisiklik olursa diye. bu yüzden published edip yayına soktuk gibi.
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi: String) {
        downloaderClient.filmleriIndir(search: filmIsmi) {  sonuc in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async { // aşağıdaki islem  filmler published'ini degistiricek bu da arayüzde bir degisiklige neden olur. Bu yüzden DispatchQueue ile yaparız.
                        self.filmler = filmDizisi.map(FilmViewModel.init)   // filmDizisini optional'dan cıkartıp filmler degiskenine atıyoruz.  map ile de dönüstürme yapıyorzu uygun istedigimiz formata.  İnternette aldıgımız filmleri FilmViewModel'a dönüstürmüs oluyoruz map ile.
                    }
                    
                }
            }
        }
    }
}


struct FilmViewModel {
    let film: Film
    
    var title: String {
        film.title
    }
    
    var poster: String {
        film.poster
    }
    
    var year: String {
        film.year
    }
    
    var imdbId: String {
        film.imdbId
    }
    
}
