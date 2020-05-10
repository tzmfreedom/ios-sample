//
//  ListViewControllerPreview.swift
//  StandardUIKit
//
//  Created by makoto tajitsu on 2020/05/07.
//  Copyright © 2020 freedom-man.com. All rights reserved.
//

// ListViewControllerPreviews.swift
#if DEBUG
import SwiftUI

struct ListViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return ListViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //update your code here
    }
}

struct ListViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        return ListViewRepresentable()
    }
}
#endif
