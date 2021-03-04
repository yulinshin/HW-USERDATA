//
//  Users.swift
//  HW-USERDATA
//
//  Created by yulin on 2021/3/4.
//

import Foundation
import UIKit

struct UserinfosArry :Decodable {
    var results :[ResultsType]
}

struct ResultsType :Decodable {
    var gender :String
    var name :NameType
    var location:LocationType
    var email :String
    var phone :String
    var cell :String
    var picture :PictureType
    var registered :Registered
    
}

struct Registered :Decodable {
    
    var date :String
    var age :Int
    
}

struct PictureType :Decodable{
    var large :URL
    var medium :URL
    var thumbnail :URL
}

struct NameType :Decodable {
    var title :String
    var first :String
    var last :String
}
struct LocationType :Decodable {
    var street: StreetType
    var city: String
    var state: String
    var country : String
    //var postcode :String?
    var coordinates :CoordinatesType
}
struct StreetType :Decodable {
    var name :String
}

struct CoordinatesType :Decodable {
    var latitude :String
    var longitude :String
}
