//
//  DetailViewController.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/07.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let name: String
    var item: ProgLangItem
    var tableView: UITableView?
    
    init(name: String) {
        self.name = name
        self.item = ProgLangItem(name: "", codes: [])
        super.init(nibName: nil, bundle: nil)

        let manager = ProgLangItemManager()
        manager.fetch { () in
            self.item = manager.get(name: name)!
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        self.name = ""
        self.item = ProgLangItem(name: "", codes: [])
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let tableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.width,
                height: view.frame.height
            )
        )
        self.tableView = tableView
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func menuItems() -> [String] {
        return self.item.menuItems()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.menuItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.menuItems()[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = self.menuItems()[indexPath.row]
        let vc = MenuItemDetailViewController(lang: name, code: self.item.getCode(name: menuItem)!)
        navigationController?.pushViewController(vc, animated: true)
    }
}


#if DEBUG
import SwiftUI

struct DetailViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UINavigationController(
            rootViewController: DetailViewController(name: "Swift")
        ).view
        //return ListViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //update your code here
    }
}

struct DetailViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        return DetailViewRepresentable()
    }
}
#endif
