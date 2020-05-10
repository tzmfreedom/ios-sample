//
//  ListViewController.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/07.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit

class ListViewController : UIViewController {
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = ProgLangItemManager()
        view.backgroundColor = UIColor.white

        let tableView = UITableView(
            frame: CGRect(
                x: 0,
                y: 0,
                width: view.frame.width,
                height: view.frame.height
            )
        )
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        manager.fetch {
            self.items = manager.items.map { $0.name }
            DispatchQueue.main.async {
                tableView.reloadData()
            }
        }
    }
}

extension ListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return items.count
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }

    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = items[indexPath.row]
        let vc = DetailViewController(name: name)
        vc.title = name
        navigationController?.pushViewController(vc, animated: true)
    }
}

#if DEBUG
import SwiftUI

struct ListViewRepresentable2: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UINavigationController(
            rootViewController: ListViewController()
        ).view
        //return ListViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //update your code here
    }
}

struct ListViewControllerPreviews2: PreviewProvider {
    static var previews: some View {
        return ListViewRepresentable2()
    }
}
#endif
