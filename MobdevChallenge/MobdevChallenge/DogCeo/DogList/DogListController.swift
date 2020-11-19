import UIKit
import API
import Shared

class DogListController: UITableViewController,  DogBreedsListPresenterDelegate {
    
    var presenter: DogBreedsListPresenter
    var breeds: [String] = []
    
    required init?(coder: NSCoder) {
        self.presenter = DogBreedsListPresenter(with: API.DogCeoQueries.shared)
        super.init(coder: coder)
    }
    
    // Mark - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.delegate = self
        self.presenter.fetch()
    }
    
    // Mark - Presenter Delegate
    func refresh() {
        Shared.log.trace("Found \(self.breeds.count) Dog Breeds")
        self.tableView.reloadData()
    }
    
    // Mark - Table View Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.breeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = self.breeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.dogCellIdentifier, for:indexPath)
        cell.textLabel?.text = item
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = self.breeds[indexPath.row]
        Shared.log.trace("Selected \(breed)")
        
        let popup : DogDetailController = self.storyboard?.instantiateViewController(withIdentifier: self.presenter.dogDetailIdentifier) as! DogDetailController
        
        popup.breed = breed
        
        self.navigationController?.pushViewController(popup, animated: true)
    }

}

