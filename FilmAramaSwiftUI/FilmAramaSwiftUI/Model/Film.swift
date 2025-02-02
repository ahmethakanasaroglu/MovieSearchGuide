//
//  Film.swift
//  FilmAramaSwiftUI
//
//  Created by Ahmet Hakan Asaroğlu on 31.01.2025.
//

import Foundation

struct Film: Codable {    // Codable = Encodable + Decodable
    let title: String
    let year: String
    let imdbId: String
    let type: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {   // String olacak değerler ve Key'leri vericez. Kodlama anahtar kelimelerini verdik.
        case title = "Title"      // cekecegimiz verideki isimelri sağdaki gibi yazıyor. biz içeride soldaki gibi atadık onları.
        case year = "Year"
        case imdbId = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
    
}




struct GelenFilmler: Codable {
    let filmler : [Film]      // veride dizi şeklinde olduğu için üstte veri formatını dizi olarak cagırıcaz burada.
    
    private enum CodingKeys: String, CodingKey {
        case filmler = "Search"   // gelen veride Search'ün içinde dizi formatında gelecek veri cünkü.
    }
}


