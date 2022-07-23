//
//  Enums.swift
//  Ambar
//
//  Created by Tugay on 21.07.2022.
//

import Foundation

enum TabItem: String, CaseIterable{
    case refrigetor = "refrigerator"
    case cellar = "cellar"
    case addProduct = "add product"
}


enum ProductGroup : CaseIterable{
    case FruitsAndVeggies
    case MeatChickenFish
    case Dairy
    case Breakfast
    case BasicFood
    case Frozen
    case Bakery
    case Beverage
}


enum ProductType : String, CaseIterable {
    case Milk = "Milk", Egg = "Egg", Bread = "Bread" , Butter = "Butter"
    
    var productGroup : ProductGroup {
        switch self {
        case .Milk, .Egg, .Butter:
            return .Dairy
        case .Bread:
            return .Bakery
        }
    }
}




enum AmountType : String, CaseIterable {
    case Piece = "Pcs", Weight = "kg", Volume = "L"
}
