//
//  RecipeListViewController.swift
//  TestiOSExalt
//
//  Created by Juan Manuel Moreno on 7/06/23.
//

import Foundation
import UIKit

protocol RecipeListDisplayProtocol: AnyObject {
    func getRecipeList()
    func displayRecipeList(directory: RecipeList.ViewModel)
    //func displayUser(user: User.ViewModel)
}

class RecipeListViewController: UIViewController, RecipeListDisplayProtocol {
    
    @IBOutlet weak var tableUser : UITableView!
    @IBOutlet weak var autocomplete: UITextField!
    
    var interactor: RecipeListInteractor?
    var presenter: RecipeListPresenterProtocol?
    let identifier = "RecipeListTableViewCell"
    var directory: RecipeList.ViewModel?
    var filtered: RecipeList.ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        self.presenter = RecipeListPresenter(vc: self)
        self.interactor = RecipeListInteractor(presenter: self.presenter!)
        self.autocomplete.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        self.setupTableView()
        self.getRecipeList()
    }
    
    func setupTableView() {
        tableUser.delegate = self
        tableUser.dataSource = self
        tableUser.register(UINib(nibName: self.identifier, bundle: nil), forCellReuseIdentifier: self.identifier)
    }
    
    func getRecipeList() {
        self.interactor?.getRecipeList()
    }
    
    func displayDirectory(directory: Directory.ViewModel) {
        self.directory = directory
        self.filtered = self.directory
        self.tableUser.reloadData()
    }
    
    func displayUser(user: User.ViewModel) {
        RecipeListRouter().routeToUser(source: self, user: user)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        self.filtered?.directory = self.directory!.directory
        if textField.text!.count > 0 {
            self.filtered?.directory = self.directory!.directory.filter { $0.name.localizedCaseInsensitiveContains(textField.text!) }
        }
        self.tableUser.reloadData()
    }
}

extension RecipeListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.filtered?.directory.count)!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = filtered?.directory[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! UserTableViewCell
        cell.labelUserName.text = user?.name
        cell.labelPhone.text = user?.phone
        cell.labelEmail.text = user?.email
        return cell
    }
}

extension RecipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let request = User.Request(id: (self.filtered?.directory[indexPath.row].id)!)
        self.interactor?.getUser(user: request)
    }
}
