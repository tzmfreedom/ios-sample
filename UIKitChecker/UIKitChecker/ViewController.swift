//
//  ViewController.swift
//  UIKitChecker
//
//  Created by makoto tajitsu on 2020/05/16.
//  Copyright © 2020 makoto tajitsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textField: UITextField?
    var stackView: UIStackView?
    var colorDelegate: ColorTextFieldDelegate?
    var colorTextField: UISelectField?
    
    let colors = [
        "red",
        "blue",
        "black",
        "yellow",
        "green",
        "white",
        "orange",
        "purple",
        "gray"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let stackView = UIStackView().apply { it in
            it.translatesAutoresizingMaskIntoConstraints = false
            it.axis = .vertical
            it.alignment = .fill
            it.distribution = .fillProportionally
            it.spacing = 0
        }
        self.stackView = stackView
        view.addSubview(stackView)

        self.textField = UITextField().apply { it in
            it.textColor = .black
            it.font = UIFont.systemFont(ofSize: 20)
            it.text = "Hello World222"
            it.textColor = .red
            it.addTarget(self, action: #selector(ViewController.onChangeText), for: .editingChanged)
        }
        stackView.addArrangedSubview(textField!)

        let colorView = UIPickerView().apply { it in
            it.delegate = self
            it.dataSource = self
        }

        colorDelegate = ColorTextFieldDelegate()
        self.colorTextField = UISelectField().apply { it in
            it.textColor = .black
            it.font = UIFont.systemFont(ofSize: 20)
            it.text = "red"
            it.inputView = colorView
            it.delegate = colorDelegate
        }
        
        let toolBar = UIToolbar().apply { it in
            it.sizeToFit()
            let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.colorDone))
            it.setItems([button], animated: true)
            it.isUserInteractionEnabled = true
        }
        colorTextField?.inputAccessoryView = toolBar
        stackView.addArrangedSubview(colorTextField!)

        let fontSizeTextField = UITextField().apply { it in
            it.textColor = .black
            it.font = UIFont.systemFont(ofSize: 20)
            it.text = "20"
            it.addTarget(self, action: #selector(self.onChangeFontSize), for: .editingDidEnd)
        }
        stackView.addArrangedSubview(fontSizeTextField)

        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top).isActive = true
        stackView?.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    }
    
    @objc func onChangeText(sender: UITextField) {
        textField?.text = sender.text!
        textField?.reloadInputViews()
    }
    
    @objc func colorDone() {
        view.endEditing(true)
    }
    
    @objc func onChangeFontSize(sender: UITextField) {
        let tf = textField!
        tf.font! = tf.font!.withSize(
            CGFloat(
                Int(sender.text!)!
            )
        )
        textField?.reloadInputViews()
    }
}

class ColorTextFieldDelegate : NSObject, UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }
}

protocol ApplyProtocol {}

extension ApplyProtocol {
    func _let(closure: (Self) -> Void) {
        closure(self)
    }

    func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ApplyProtocol {}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        colors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let color: UIColor
        switch colors[row] {
        case "red":
            color = UIColor.red
        case "blue":
            color = UIColor.blue
        case "black":
            color = UIColor.black
        case "yellow":
            color = UIColor.yellow
        case "green":
            color = UIColor.green
        case "white":
            color = UIColor.white
        case "orange":
            color = UIColor.orange
        case "purple":
            color = UIColor.purple
        case "gray":
            color = UIColor.gray
        default:
            color = UIColor.black
        }
        colorTextField?.text = colors[row]
        colorTextField?.reloadInputViews()
        textField?.textColor = color
        textField?.reloadInputViews()
    }
}


class UISelectField : UITextField {
    public override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
}

#if DEBUG
import SwiftUI

struct ViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return ViewController().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        //update your code here
    }
}

class ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        return ViewRepresentable()
    }

    @objc class func injected() {
        UIApplication.shared.windows.first?.rootViewController =
                UIHostingController(rootView: ViewRepresentable())
    }
}
#endif
