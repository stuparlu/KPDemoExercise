//
//  ADDetails.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct ADDetails: Decodable {
    let ad_id: String
    let location_name: String
    let cateogry_name: String
    let group_name: String
    let description: String
    let photos: String
}
