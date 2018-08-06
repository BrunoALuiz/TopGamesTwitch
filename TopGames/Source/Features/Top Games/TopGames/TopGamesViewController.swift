//
//  TopGamesViewController.swift
//  TopGames
//
//  Created by Bruno Luiz on 23/07/18.
//  Copyright © 2018 Bruno Luiz. All rights reserved.
//

import UIKit

class TopGamesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var games: [GameRank] = []
    
    let activityIndicator = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.color = .black
        self.activityIndicator.center = self.view.center
        self.view.addSubview(self.activityIndicator)
        
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        self.loadData()
    }
    
    @objc private func refreshData() {
        
    }
    
    func loadData() {
        self.activityIndicator.startAnimating()
        let offset = self.games.count == 0 ? 0 : self.games.count - 1
        TopGamesProvider.getAll(fromOffSet: offset) { (gameResult, isSuccess, error) in
            self.games.append(contentsOf: gameResult)
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
            if !isSuccess {
                let alertController: UIAlertController = UIAlertController(title: "Access Error!",
                                                                           message: "Can't connect to database.",
                                                                           preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

extension TopGamesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let gameResultCell = tableView.dequeueReusableCell(withIdentifier: "TopGamesCell", for: indexPath) as? TopGamesCell,
            let game = self.games[indexPath.row].game,
            let gameImageURL = URL(string: game.imageURL ?? "") {
            gameResultCell.nameLabel?.text = game.name?.capitalized
            gameResultCell.positionLabel?.text = "\(indexPath.row + 1)"
            gameResultCell.gameImageView?.load(url: gameImageURL)
            
            return gameResultCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.games.count - 1 {
            self.loadData()
        }
    }
}

extension TopGamesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

