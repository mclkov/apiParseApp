//
//  MainTableView.swift
//  apiParseApp
//
//  Created by McL on 3/2/19.
//  Copyright © 2019 McL. All rights reserved.
//

import UIKit

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: MainConstants.cellReuseId, for: indexPath) as! ExchangeRateCell
        let exchangeRate = self.exchangeRates[indexPath.row]
        
        cell.configureCell(exchangeRate: exchangeRate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exchangeRates.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func registerCellReuseId() {
        self.mainTableView.register(ExchangeRateCell.self, forCellReuseIdentifier: MainConstants.cellReuseId)
    }
}
