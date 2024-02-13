//
//  ADList.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct ADList: Decodable {
    let pages: Int
    let page: Int
    let ads: [ADData]
}
