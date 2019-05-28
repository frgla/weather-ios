//
//  ForecastViewController.swift
//  WeatherApp
//
//  Created by Gauss on 27/05/2019.
//  Copyright © 2019 Fran Glavota. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "SingleTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "SingleTableViewCell")
    }
}

extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SingleTableViewCell", for: indexPath) as! SingleTableViewCell
        cell.config(with: data[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}
