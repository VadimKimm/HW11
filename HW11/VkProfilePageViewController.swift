//
//  VkProfilePageViewController.swift
//  HW11
//
//  Created by Vadim Kim on 18.05.2022.
//

import UIKit

class VkProfilePageViewController: UIViewController {

    // MARK: - StackViews

    private lazy var parentsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        return stackView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupHierarchy()
        setupLayout()
        setupView()
    }

    // MARK: - Settings
    private func setupHierarchy() {
        view.addSubview(parentsStackView)
    }

    private func setupLayout() {
        parentsStackView.translatesAutoresizingMaskIntoConstraints = false
        parentsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Metric.leftOffset).isActive = true
        parentsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metric.topOffset).isActive = true
        parentsStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: Metric.rightOffset).isActive = true
    }

    private func setupView() {
        view.backgroundColor = Colors.backgroundColor
    }
}

// MARK: - Constants

extension VkProfilePageViewController {
    enum Metric {
        static let leftOffset: CGFloat = 20
        static let topOffset: CGFloat = 25
        static let rightOffset: CGFloat = -20

        static let headerStackViewSpacing: CGFloat = 10
    }

    enum Colors {
        static let backgroundColor = UIColor(red:  25.0 / 255.0, green: 25.0 / 255.0, blue:  25.0 / 255.0, alpha: 1)
    }
}

