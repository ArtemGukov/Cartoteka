//
//  Extension+TextField.swift
//  Cartoteka
//
//  Created by Артем on 04/10/2019.
//  Copyright © 2019 Gukov.tech. All rights reserved.
//

import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}
