//
//  OzonDataService.swift
//  ozon
//
//  Created by Administrator on 08/02/2019.
//  Copyright © 2019 Amplitudo. All rights reserved.
//

import Foundation

import Foundation

class OzonDataService{
    static let instance = OzonDataService();
    func getCities() -> [String] {
        return ["Andrijevica",
                "Bar",
                "Berane",
                "Bijelo Polje",
                "Budva",
                "Cetinje",
                "Danilovgrad",
                "Kolašin",
                "Kotor",
                "Mojkovac",
                "Nikšić",
                "Herceg Novi",
                "Podgorica",
                "Plav",
                "Pljevlja",
                "Rožaje",
                "Šavnik",
                "Tivat",
                "Ulcinj",
                "Žabljak"]
    }
    func getTemperatures() -> [String] {
        return ["15",
                "25",
                "16",
                "14",
                "29",
                "28",
                "17",
                "18",
                "32",
                "12",
                "26",
                "31",
                "35",
                "19",
                "20",
                "12",
                "11",
                "33",
                "13",
                "34"]
    }
}
