//
//  Manager.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 18.01.21.
//

import Foundation

class Manager {
    
    static let shared = Manager()
    
    let pages = [
        Page(imageName: "theory_image", pageText: "Знания - сила"),
        Page(imageName: "sushi", pageText: "Суши - вкусно"),
        Page(imageName: "vobla", pageText: "Рыба - к пиву"),
        Page(imageName: "vobla", pageText: "Вобла - всему голова и спинка")
    ]
}
