//
//  JsonFileData.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct ADListArray: Decodable {
    let listaOglasa: [ADList]
}

struct ADDetailList: Decodable {
    let detaljiOglasa: [ADDetails]
}

