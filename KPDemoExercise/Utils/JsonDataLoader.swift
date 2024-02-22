//
//  JsonDataLoader.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct JsonDataLoader {
    static func loadAdList() -> [ADList]? {
        if let url = Bundle.main.url(forResource: KeyStrings.resourceFile, withExtension: KeyStrings.json) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let fileData = try decoder.decode(ADListArray.self, from: data)
                return fileData.listaOglasa
            } catch {
                print("Error reading or decoding the JSON file: \(error)")
            }
        } else {
            print("Couldn't find the file in the main bundle")
        }
        return nil
    }
    
    static func loadAdDescription() -> [ADDetails] {
        if let url = Bundle.main.url(forResource: KeyStrings.resourceFile, withExtension: KeyStrings.json) {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                return (try decoder.decode(ADDetailList.self, from: data)).detaljiOglasa
            } catch {
                print("Error reading or decoding the JSON file: \(error)")
            }
        } else {
            print("Couldn't find the file in the main bundle")
        }
        return []
    }
}
