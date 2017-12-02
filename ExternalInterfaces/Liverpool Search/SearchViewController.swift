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

fileprivate extension DefaultsKeys {
    static let searchedStrings = DefaultsKey<[String]>("searchedStrings")
}

class SearchViewController: UIViewController, UITextFieldDelegate {

    private var dataSource: SimplePrefixQueryDataSource!
    private var ramReel: RAMReel<RAMCell, UITextField, SimplePrefixQueryDataSource>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = SimplePrefixQueryDataSource(Defaults[.searchedStrings])
        resetRamReel(with: dataSource)
    }
    
    private func resetRamReel(with dataSource: SimplePrefixQueryDataSource) {
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
        self.ramReel = ramReel
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        if let text = textField.text {
            var searchHistory = Defaults[.searchedStrings]
            searchHistory.append(text)
            Defaults[.searchedStrings] = searchHistory
            dataSource = SimplePrefixQueryDataSource(Defaults[.searchedStrings])
            resetRamReel(with: dataSource)
            let resultsView = UIViewController()
            resultsView.view.frame = self.view.bounds
            resultsView.title = "Buscaste: \(text)"
            resultsView.view.backgroundColor = .white
            let textView = UITextView()
            resultsView.view.addSubview(textView)
            textView.frame = self.view.bounds
            fetchViewModels(with: text, completion: { (viewModels) in
                var textResult = ""
                viewModels.forEach({ (viewModel) in
                    textResult = textResult +
                        viewModel.top + "\n" +
                        viewModel.middle + "\n" +
                        viewModel.bottom + "\n\n"
                })
                DispatchQueue.main.async {
                    textView.text = textResult
                    self.navigationController?.pushViewController(resultsView, animated: true)
                }
            })
          
        }
    }
    
    private func fetchViewModels(with string: String, completion: @escaping ([ItemViewModel]) -> Void) {
        let task = URLSession.shared.itemsTask(with: URL.liverpoolSearch(with: string)) { (items) in
            let viewModels = items.map({ (item) -> ItemViewModel in
                return ItemViewModel(top: item.displayName, middle: item.salePrice, bottom: item.imageURL, data: Data())
            })
            completion(viewModels)
        }
        task.resume()
    }
}

