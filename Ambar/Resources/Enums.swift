//
//  Enums.swift
//  Ambar
//
//  Created by Tugay on 21.07.2022.
//

import Foundation




enum ProductGroup : CaseIterable {
    case FruitsAndVeggies
    case MeatChickenFish
    case Dairy
    case Breakfast
    case BasicFood
    case Frozen
    case Bakery
    case Beverage
}

enum AmountType : CaseIterable {
    case Kg, Pcs
    
    var cases: [String]{
        return [""]
    }
}
