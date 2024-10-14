//
//  ViewController.swift
//  MapBook
//
//  Created by Okan Karaman on 14.10.2024.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // TableView oluştur
    let tableView = UITableView()

    // Örnek veriler
    let data = ["Satır 1", "Satır 2", "Satır 3", "Satır 4", "Satır 5"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // TableView'i ekrana ekle
        view.addSubview(tableView)

        // TableView Delegate ve DataSource ayarları
        tableView.delegate = self
        tableView.dataSource = self

        // TableView'in otomatik layout ile tam ekran yerleşimini sağla
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // Hücre için bir yeniden kullanım kimliği kaydedin
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    // TableView için kaç satır olacağını belirle
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    // Her hücre için veri sağlar
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
}
