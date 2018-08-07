//
//  GameDetailViewController.swift
//  TopGames
//
//  Created by Bruno Luiz on 06/08/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import UIKit

class GameDetailViewController: UIViewController {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var viewersLabel: UILabel!
    
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let gameImageURL = URL(string: self.game?.imageURL ?? "") {
            self.gameImageView.load(url: gameImageURL)
        }
        
        self.nameLabel.text = self.game?.name
        self.viewersLabel.text = String(self.game?.popularity ?? 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}