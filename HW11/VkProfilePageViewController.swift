//
//  VkProfilePageViewController.swift
//  HW11
//
//  Created by Vadim Kim on 18.05.2022.
//

import UIKit

class VkProfilePageViewController: UIViewController {

    private lazy var profileImageView: UIImageView = {
        var imageView = UIImageView()
        let profileImage = UIImage(named: "profileImage")

        let imageDiameter = 85
        let imageSize = CGSize(width: imageDiameter, height: imageDiameter)
        let image = UIImage(named: "profileImage")?.crop(to: imageSize)

        imageView.image = image?.circle()

        return imageView
    }()

    // MARK: - headerSideStackView objects

    private lazy var fullNameLabel: UILabel = {
        var label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Strings.fullNameLabelText
        label.font = .systemFont(ofSize: Metric.fullNameLabelFontSize, weight: .semibold)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5

        return label
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Установить статус", for: .normal)
        button.setTitleColor(Colors.customBlue, for: .normal)

        return button
    }()

    private lazy var onlineIndicatorLabel: UILabel = {
        var label = UILabel()

        let image = NSTextAttachment()
        let imageColor = Colors.customGray
        let imageConfig = UIImage.SymbolConfiguration(weight: .bold)
        image.image = UIImage(systemName: "phone.fill")?.withTintColor(imageColor)
        image.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)

        let fullString = NSMutableAttributedString(string: Strings.onlineIndicatorLabelText)
        fullString.append(NSAttributedString(attachment: image))
        label.attributedText = fullString

        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: Metric.onlineIndicatorLabelFontSize, weight: .regular)
        label.textColor = Colors.customGray

        return label
    }()

    // MARK: - profileButtonsStackView objects

    private lazy var editButton: UIButton = { //
        let button = UIButton(type: .system)

        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Редактировать", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: Metric.editbuttonFontSize, weight: .regular)
        button.backgroundColor = Colors.editButtonColor
        button.heightAnchor.constraint(equalToConstant: 34).isActive = true
        button.widthAnchor.constraint(equalTo: button.heightAnchor, multiplier: 15).isActive = true
        button.layer.cornerRadius = 10

        return button
    }()
    // MARK: - StackViews

    private lazy var parentsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.parentsStackViewSpacing
        stackView.distribution = .equalSpacing

        return stackView
    }()

    //Includes profileImageView and headerSideStackView
    private lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .horizontal
        stackView.spacing = Metric.headerStackViewSpacing
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var headerSideStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.headerSideStackViewSpacing
        stackView.alignment = .leading

        return stackView
    }()

    private lazy var profileButtonsStackView: UIStackView = {
        let stackView = UIStackView()

        stackView.axis = .vertical
        stackView.spacing = Metric.profileButtonsStackViewSpacing
        stackView.alignment = .center

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

        parentsStackView.addArrangedSubview(headerStackView)
        parentsStackView.addArrangedSubview(profileButtonsStackView)

        headerStackView.addArrangedSubview(profileImageView)
        headerStackView.addArrangedSubview(headerSideStackView)

        headerSideStackView.addArrangedSubview(fullNameLabel)
        headerSideStackView.addArrangedSubview(setStatusButton)
        headerSideStackView.addArrangedSubview(onlineIndicatorLabel)

        profileButtonsStackView.addArrangedSubview(editButton)
    }

    private func setupLayout() {
        parentsStackView.translatesAutoresizingMaskIntoConstraints = false
        parentsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Metric.parentsStackViewLeftOffset).isActive = true
        parentsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                              constant: Metric.parentsStackViewTopOffset).isActive = true
        parentsStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,
                                                constant: Metric.parentsStackViewRightOffset).isActive = true

        headerSideStackView.translatesAutoresizingMaskIntoConstraints = false
        headerSideStackView.topAnchor.constraint(equalTo: parentsStackView.topAnchor,
                                                 constant: Metric.headerSideStackViewTopOffset).isActive = true

        profileButtonsStackView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupView() {
        view.backgroundColor = Colors.backgroundColor
    }
}

// MARK: - Constants

extension VkProfilePageViewController {
    enum Metric {
        static let parentsStackViewLeftOffset: CGFloat = 20
        static let parentsStackViewTopOffset: CGFloat = 25
        static let parentsStackViewRightOffset: CGFloat = -20
        static let parentsStackViewSpacing: CGFloat = 15
        static let headerSideStackViewTopOffset: CGFloat = 8
        static let profileButtonsStackViewSpacing: CGFloat = 12

        static let headerStackViewSpacing: CGFloat = 12
        static let headerSideStackViewSpacing: CGFloat = -2

        static let fullNameLabelFontSize: CGFloat = 19
        static let onlineIndicatorLabelFontSize: CGFloat = 14

        static let editbuttonFontSize: CGFloat = 16
    }

    enum Strings {
        static let fullNameLabelText = "Вадим Ким"
        static let onlineIndicatorLabelText = "online "
    }

    enum Colors {
        static let backgroundColor = UIColor(red:  25.0 / 255.0, green: 25.0 / 255.0, blue:  25.0 / 255.0, alpha: 1)
        static let customGray = UIColor(red:  166.0 / 255.0, green: 176.0 / 255.0, blue:  188.0 / 255.0, alpha: 1)
        static let customBlue = UIColor(red:  139 / 255.0, green: 182 / 255.0, blue:  255 / 255.0, alpha: 1)

        static let editButtonColor = UIColor(red:  45 / 255.0, green: 45 / 255.0, blue:  45 / 255.0, alpha: 1)
    }
}

// MARK: - UIImage extension

extension UIImage {

func crop(to:CGSize) -> UIImage {

    guard let cgimage = self.cgImage else { return self }

    let contextImage: UIImage = UIImage(cgImage: cgimage)

    guard let newCgImage = contextImage.cgImage else { return self }

    let contextSize: CGSize = contextImage.size

    //Set to square
    var posX: CGFloat = 0.0
    var posY: CGFloat = 0.0
    let cropAspect: CGFloat = to.width / to.height

    var cropWidth: CGFloat = to.width
    var cropHeight: CGFloat = to.height

    if to.width > to.height { //Landscape
        cropWidth = contextSize.width
        cropHeight = contextSize.width / cropAspect
        posY = (contextSize.height - cropHeight) / 2
    } else if to.width < to.height { //Portrait
        cropHeight = contextSize.height
        cropWidth = contextSize.height * cropAspect
        posX = (contextSize.width - cropWidth) / 2
    } else { //Square
        if contextSize.width >= contextSize.height { //Square on landscape (or square)
            cropHeight = contextSize.height
            cropWidth = contextSize.height * cropAspect
            posX = (contextSize.width - cropWidth) / 2
        }else{ //Square on portrait
            cropWidth = contextSize.width
            cropHeight = contextSize.width / cropAspect
            posY = (contextSize.height - cropHeight) / 2
        }
    }

    let rect: CGRect = CGRect(x: posX, y: posY, width: cropWidth, height: cropHeight)

    // Create bitmap image from context using the rect
    guard let imageRef: CGImage = newCgImage.cropping(to: rect) else { return self}

    // Create a new image based on the imageRef and rotate back to the original orientation
    let cropped: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)

    UIGraphicsBeginImageContextWithOptions(to, false, self.scale)
    cropped.draw(in: CGRect(x: 0, y: 0, width: to.width, height: to.height))
    let resized = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return resized ?? self
  }

    func circle() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let renderer = UIGraphicsImageRenderer(size: rect.size)
        let result = renderer.image { c in
            let isPortrait = size.height > size.width
            let isLandscape = size.width > size.height
            let breadth = min(size.width, size.height)
            let breadthSize = CGSize(width: breadth, height: breadth)
            let breadthRect = CGRect(origin: .zero, size: breadthSize)
            let origin = CGPoint(x: isLandscape ? floor((size.width - size.height) / 2) : 0,
                                 y: isPortrait  ? floor((size.height - size.width) / 2) : 0)
            let circle = UIBezierPath(ovalIn: breadthRect)
            circle.addClip()
            if let cgImage = self.cgImage?.cropping(to: CGRect(origin: origin, size: breadthSize)) {
                UIImage(cgImage: cgImage, scale: self.scale, orientation: self.imageOrientation).draw(in: rect)
            }
        }
        return result
    }
}
