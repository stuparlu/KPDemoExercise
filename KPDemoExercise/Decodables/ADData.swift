//
//  ADData.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct ADData: Codable {
    let ad_id: Int
    let posted: String
    let location_name: String
    let name: String
    let price: String
    let currency: String?
    let price_fixed: String
    let photo1_tmb_300x300: String
    let favorite_count: Int
    let is_following_ad: Bool
}
