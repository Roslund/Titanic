//
//  FileParser.swift
//  Titanic
//
//  Created by Anton Roslund on 2018-02-10.
//  Copyright © 2018 Anton Roslund. All rights reserved.
//

import Foundation

func parseFile(_ file: String) -> (cases: [[Double]], awnsers: [Double]) {
    var cases: [[Double]] = []
    var awnsers: [Double] = []
    
    for line in file.components(separatedBy: .newlines) {
        let values = line.split(separator: ",")
        let doubles = values.map({Double($0)!})
        
        cases.append(Array(doubles[...2]))
        awnsers.append(doubles[3])
    }
    
    return (cases, awnsers)
}
