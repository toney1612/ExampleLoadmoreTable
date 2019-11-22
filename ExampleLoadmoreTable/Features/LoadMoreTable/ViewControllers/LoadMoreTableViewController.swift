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
    
}
