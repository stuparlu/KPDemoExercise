//
//  MainListViewModel.swift
//  KPDemoExercise
//
//  Created by Luka Stupar on 13.2.24..
//

import Foundation

struct MainListViewModel {
    let tableViewCellData: [ADData]
    let totalPages: Int
    
    init() {
        let listData = JsonDataLoader.loadAdList()?.flatMap({$0.ads}) ?? []
        self.tableViewCellData = listData.sorted(by: {$0.favorite_count > $1.favorite_count})
        self.totalPages = Int(ceil(Float(self.tableViewCellData.count) / 10.0))
    }
}
