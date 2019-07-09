//
//  DModel.swift
//  FundSwift
//
//  Created by D on 2019/7/9.
//  Copyright © 2019 D. All rights reserved.
//

import Foundation

struct DModel: Codable {
    var code: DStrInt
    var data: DMData
    
    struct DMData: Codable {
        var stateCode: DStrInt
        var message: String
        var returnData: DMReturnData?
    }
    
    struct DMReturnData: Codable {
        var rankinglist: [DMRankingList]?
    }
    
    struct DMRankingList: Codable {
        var title: String
        var subTitle: String
        var cover: String
        var argName: String
        var argValue: DStrInt
        var rankingType: String
    }
}
