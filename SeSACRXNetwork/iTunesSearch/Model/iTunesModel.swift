//
//  iTunesModel.swift
//  SeSACRXNetwork
//
//  Created by 김진수 on 4/7/24.
//

import Foundation

struct iTunesModel: Decodable {
    let results: [Contents]
}

struct Contents: Decodable {
    let trackName: String
    let artistName: String
    let isGameCenterEnabled: Bool
    let supportedDevices: [String]
    let screenshotUrls: [String]
    let artworkUrl512: String // 사진
    let contentAdvisoryRating: String
    let version: String
    let description: String
    
    init(trackName: String = "", artistName: String = "", isGameCenterEnabled: Bool = false, supportedDevices: [String] = [""], screenshotUrls: [String] = [""], artworkUrl512: String = "", contentAdvisoryRating: String = "", version: String = "", description: String = "") {
        self.trackName = trackName
        self.artistName = artistName
        self.isGameCenterEnabled = isGameCenterEnabled
        self.supportedDevices = supportedDevices
        self.screenshotUrls = screenshotUrls
        self.artworkUrl512 = artworkUrl512
        self.contentAdvisoryRating = contentAdvisoryRating
        self.version = version
        self.description = description
    }
}
