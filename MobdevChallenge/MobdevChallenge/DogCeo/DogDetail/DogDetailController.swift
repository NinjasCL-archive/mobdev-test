import UIKit
import API
import Shared

public final class DogDetailController: UITableViewController, DogDetailPresenterDelegate {
    
    public var presenter: DogDetailPresenter
    
    public var dogs: [Dog] = []
    
    public var breed: DogBreedName
    
    required init?(coder: NSCoder) {
        self.presenter = DogDetailPresenter(with: API.DogCeoQueries.shared)
        self.breed = ""
        super.init(coder: coder)
    }
    
    // Mark - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        Shared.log.trace("Initializing with Breed: \(String(describing: self.breed))")
        self.presenter.delegate = self
        self.presenter.breed = self.breed
        
        self.title = self.presenter.title
        self.presenter.fetch()
    }
    
    // Mark - Presenter Delegate
    public func refresh() {
        self.tableView.reloadData()
    }
    
    // Mark - Table View Delegate
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.presenter.dogCellHeight)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dogs.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.dogCellIdentifier, for:indexPath) as! DogImageCell
        
        let dog = self.dogs[indexPath.row]
        cell.dog = dog
        
        cell.fetchImage()
        
        return cell
    }
}
