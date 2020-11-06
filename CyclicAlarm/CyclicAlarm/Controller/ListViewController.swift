//
//  ViewController.swift
//  CyclicAlarm
//
//  Created by MAC on 02.09.2020.
//  Copyright © 2020 Litmax. All rights reserved.
//

import UIKit
import RealmSwift

final class ListViewController: UIViewController {
    
    // MARK: Properties
    
    let alert = AlertController()
    let timeManager = TimeManager()
    
    var listOfAlarms: [CycleModel] = []
    
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    
    
    // MARK: Actions
    
    @IBAction func infoButton () {
        present(alert.showInfoAlert(), animated: true)
        tableView.reloadData()
    }
    
    @IBAction func addNewAlert () {
        
    }
    
    @IBAction func addButtonPress () {
        
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clearFooter()
        showMainTimeAndData()
        
        tableView.register(HeaderOfMainTableView.self,
                           forHeaderFooterViewReuseIdentifier: "sectionHeader")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentTime.center.x -= view.bounds.width
        
        
        listOfAlarms = realm.objects(CycleModel.self).map{ $0 }
        tableView.reloadData()
    }
}

// MARK: TableView

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Deselect of line
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Section settings
    func numberOfSections(in tableView: UITableView) -> Int {
        listOfAlarms.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
            "sectionHeader") as! HeaderOfMainTableView
        
        if let list = listOfAlarms.first?.name {
            view.title.text = list
        } else {
            view.title.text = "kukuruzik"
        }
        
        view.image.image = UIImage(systemName: "alarm")
        
        return view
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    
    // Rows settings
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        guard case .delete = editingStyle else { return }
        let alarm = self.listOfAlarms.remove(at: indexPath.section)
        
        tableView.performBatchUpdates {
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } completion: { (_) in
            StorageManager.deleteObject(alarm)
        }

    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    
    
}


