//
//  ContactSupport.swift
//  MyMintyApp
//
//  Created by Oko-osi Korede on 11/12/2022.
//

import UIKit

class ContactSupportVC: UIViewController {
    
    lazy var backButton = UIButton()
    lazy var contactSupportTitle = CustomLabel(text: MintynText.contactSupportTitle.text, font: .systemFont(ofSize: 18, weight: .bold))
    lazy var contactOptionsTableView = UITableView.genericTableView(cell: ContactOptionCell.self, identifier: ContactOptionCell.identifier)
    let viewModel = ContactOptionViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        [
            backButton, contactSupportTitle, contactOptionsTableView
        ].forEach { newView in
            view.addSubview(newView)
        }
        setupConstraints()
        
    }
    
    func setupConstraints() {
        setupBackButton()
        setupTitle()
        setupContactOptionsTableView()
    }
    
    func setupBackButton() {
        backButton.setViewConstraints(top: view.topAnchor, left: view.leadingAnchor, paddingTop: 40, paddingLeft: 20, width: 30, height: 30)
        backButton.cornerRadius = 15
        backButton.backgroundColor = .mintynLightBrownColor
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.tintColor = .mintynDefaultBrownColor
        backButton.addTarget(self, action: #selector(backButtontapped), for: .touchUpInside)
    }
    
    func setupTitle() {
        contactSupportTitle.setViewConstraints(top: backButton.topAnchor, paddingTop: 5)
        contactSupportTitle.setCenterAnchor(horizontal: view.centerXAnchor)
    }
    
    func setupContactOptionsTableView() {
        contactOptionsTableView.setViewConstraints(top: contactSupportTitle.bottomAnchor, right: view.trailingAnchor, bottom: view.bottomAnchor, left: view.leadingAnchor, paddingTop: 20)
        contactOptionsTableView.delegate = self
        contactOptionsTableView.dataSource = self
        contactOptionsTableView.separatorStyle = .none
    }
    
    @objc func backButtontapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension ContactSupportVC: UITableViewDelegate {
    
}

extension ContactSupportVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.contactOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = contactOptionsTableView.dequeueReusableCell(withIdentifier: ContactOptionCell.identifier, for: indexPath) as? ContactOptionCell else {
            return UITableViewCell()
        }
        cell.contactOption = viewModel.contactOptions[indexPath.row]
        return cell
    }
}
