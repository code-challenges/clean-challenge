//
//  ViewController.swift
//  Liverpool Search
//
//  Created by Julio Cesar Guzman Villanueva on 12/1/17.
//  Copyright © 2017 Julio Cesar Guzman Villanueva. All rights reserved.
//

import UIKit
import RAMReel
import ExternalInterfaces

extension DefaultsKeys {
    static let searchedStrings = DefaultsKey<[String]>("searchedStrings")
}

class ViewController: UIViewController, UITextFieldDelegate {

    var dataSource: SimplePrefixQueryDataSource!
    var ramReel: RAMReel<RAMCell, UITextField, SimplePrefixQueryDataSource>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = SimplePrefixQueryDataSource(Defaults[.searchedStrings])
        ramReel = make(with: dataSource)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func make(with dataSource: SimplePrefixQueryDataSource) -> RAMReel<RAMCell, UITextField, SimplePrefixQueryDataSource> {
        self.ramReel?.view.removeFromSuperview()
        self.ramReel = nil
        let frame = view.frame
        let ramReel = RAMReel<RAMCell, UITextField, SimplePrefixQueryDataSource>(frame: frame,
                                                                   dataSource: dataSource,
                                                                   placeholder: "Busqueda",
                                                                   attemptToDodgeKeyboard: true,
                                                                   hook: nil)
        ramReel.textFieldDelegate = self
        ramReel.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(ramReel.view)
        return ramReel
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let text = textField.text {
            var cambio = Defaults[.searchedStrings]
            cambio.append(text)
            Defaults[.searchedStrings] = cambio
            dataSource = SimplePrefixQueryDataSource(Defaults[.searchedStrings])
            ramReel = make(with: dataSource)
        }
    }
}

