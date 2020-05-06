import UIKit
import PlaygroundSupport

import UIKit
import PlaygroundSupport

class TableViewExampleController: UIViewController, UITableViewDataSource {
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                   "Cell", for:indexPath) as UITableViewCell
        let name = names[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    
    var tableView:UITableView?
    var names:[String] = ["Kajal","Akhil","Divij"]
    
    func createTableView() {
        self.tableView = UITableView(frame:CGRect(x: 0, y: 0, width:
                         self.view.frame.width, height:
                         self.view.frame.height))
        self.tableView?.dataSource = self
        self.tableView?.backgroundColor = .white
        self.tableView?.register(UITableViewCell.self,
           forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.tableView!)
    }
}
//class CollectionViewExampleController : UIViewController, UICollectionViewDataSource {
//    override func viewDidLoad(){
//        super.viewDidLoad()
//        createCollectionView()
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
//                   "BoxCell", for: indexPath)
//        cell.backgroundColor = .blue
//        return cell
//    }
//
//    var collectionView:UICollectionView?
//
//    func createCollectionView(){
//        self.collectionView = UICollectionView(
//            frame: CGRect(
//                x: 0,
//                y: 0,
//                width: self.view.frame.width,
//                height: self.view.frame.height
//            ),
//            collectionViewLayout: UICollectionViewFlowLayout()
//        )
//        self.collectionView?.dataSource = self
//        self.collectionView?.backgroundColor = .white
//        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "BoxCell")
//        self.view.addSubview(self.collectionView!)
//    }
//}
//
PlaygroundPage.current.liveView = TableViewExampleController()
