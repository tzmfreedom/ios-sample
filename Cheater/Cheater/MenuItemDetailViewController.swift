//
//  MenuItemDetailViewController.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/09.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

import UIKit
import Highlightr

class MenuItemDetailViewController: UIViewController {
    let lang: String
    let code: String
    let theme = "paraiso-dark"
    
    init(lang: String, code: String) {
        self.lang = lang
        self.code = code
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.lang = ""
        self.code = ""
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let highlightr = Highlightr()
        highlightr?.setTheme(to: theme)
        // You can omit the second parameter to use automatic language detection.
        let highlightedCode = highlightr?.highlight(code, as: lang)

        let textView = UITextView(
            frame: CGRect(
                x: 10,
                y: 50,
                width: self.view.frame.width,
                height: self.view.frame.height
            )
        )
        textView.attributedText = highlightedCode
        view.backgroundColor = .white
        view.addSubview(textView)
    }
}


#if DEBUG
import SwiftUI

struct MenuItemDetailViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return UINavigationController(
            rootViewController: MenuItemDetailViewController(
                lang: "swift",
                code: "let a = 4"
            )
        ).view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //update your code here
    }
}

struct MenuItemDetailViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        return MenuItemDetailViewRepresentable()
    }
}
#endif
