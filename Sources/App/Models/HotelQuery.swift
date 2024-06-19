//
//  HotelQuery.swift
//
//
//  Created by Jimmy on 19/06/24.
//

import Foundation
import Vapor

struct HotelQuery: Content {
    let sort: String
    let search: String
}
