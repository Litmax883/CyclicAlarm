//
//  ViewController.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit

final class ListViewController: UIViewController {
    
// MARK: Properties
    
    let alert = AlertController()
    

// MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView?
 
// MARK: Actions
    
    @IBAction func infoButton () {
        present(alert.showInfoAlert(), animated: true)

    }
    
    @IBAction func addNewAlert () {
        
    }
    
// MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

// MARK: TableView

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        return cell
    }
    
    
}
