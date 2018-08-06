//
//  Utils+UIImageView.swift
//  TopGames
//
//  Created by Bruno Luiz on 06/08/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
