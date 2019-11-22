<<<<<<< HEAD
import UIKit
import UIScrollView_InfiniteScroll

extension LoadMoreTableViewModel.Row {
    
    var identifier: String {
        switch self {
        case .dc(model: _):
            return LoadMoreTableViewController.Constants.dc_Identifier
        case .marvel(model: _):
            return LoadMoreTableViewController.Constants.marvel_Identifier
        }
    }
}

class LoadMoreTableViewController: UITableViewController {
    
    var viewModel = LoadMoreTableViewModel()
    
    struct Constants {
        static let marvel_Identifier = "marvel_reused_cell"
        static let dc_Identifier = "dc_reused_cell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: -  Config Infinite Scroll To Table View.
        self.tableView.addInfiniteScroll { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                // load more data
                self.repalceData()
            }
        }
        self.tableView.setShouldShowInfiniteScrollHandler { (_) -> Bool in
            return true
        }
        
        // MARK: - Setup Table
        self.setupTable()
    }
    
    private func setupTable() {
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .white
        self.tableView.register(UINib(nibName: "HeroMarvelTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.marvel_Identifier)
        self.tableView.register(UINib(nibName: "HeroDCTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.dc_Identifier)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSouce.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.viewModel.dataSouce[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: item.identifier, for: indexPath)
        if let cell = cell as? HeroMarvelTableViewCell, case let .marvel(m) = item {
            cell.configure(with: m)
        }
        if let cell = cell as? HeroDCTableViewCell, case let .dc(d) = item {
            cell.configure(with: d)
        }
        return cell
        
    }
    
    fileprivate func repalceData(){
        self.viewModel.replaceData()
        self.tableView.reloadData()
        self.tableView.finishInfiniteScroll()
    }
    
=======
//
//  LoadMoreTableViewController.swift
//  ExampleLoadmoreTable
//
//  Created by Toney on 22/11/2562 BE.
//  Copyright © 2562 Toney. All rights reserved.
//

import UIKit

class LoadMoreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

>>>>>>> 102a808752a3a71a583c130209ff43910c968ebf
}
