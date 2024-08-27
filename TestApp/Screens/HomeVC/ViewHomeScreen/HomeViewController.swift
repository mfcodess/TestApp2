//
//  HomeViewController.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    //presenter — это ссылка на объект HomePresenter, который обрабатывает логику
    //MARK: Presenter
    private var presenter: HomePresenter?
    
    //MARK: Example Country
    let options = ["🇺🇦 Ukraine", "🇯🇵 Japan", "🇨🇿 Czech", "🇫🇷 France", "🇺🇸 United States"]
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let times = ["5 am", "9 am", "11 am", "3 pm", "6 pm"]

    
    ///Home
    private lazy var homeGromusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "HomeImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.backgroundColor = .buttonColorr
        button.layer.cornerRadius = 19
        button.tintColor = .white
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        return button
    }()
    
    ///Notification
    private lazy var notificationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "NotificationImage"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        button.backgroundColor = .buttonColorr
        button.layer.cornerRadius = 19
        button.tintColor = .white
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        return button
    }()
    
    ///Upgrade
    private lazy var upgradeButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.setTitle("Upgrade", for: .normal)
        button.backgroundColor = .buttonColorr
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.layer.shadowColor = UIColor.white.cgColor
        button.layer.shadowOpacity = 0.1
        button.layer.shadowOffset = CGSize(width: 0.5, height: 0)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        return button
    }()
    
    ///StackView NavigationBar SUBVIEWS
    private lazy var navigationBarStackViewSubviews: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.spacing = 7
        
        stackView.addArrangedSubview(upgradeButton)
        stackView.addArrangedSubview(notificationButton)
        
        return stackView
    }()
    
    ///StackView NavigationBar MAIN
    private lazy var navigationBarStackViewMain: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(homeGromusButton)
        stackView.addArrangedSubview(navigationBarStackViewSubviews)
        
        return stackView
    }()
    
    ///Title
    private lazy var titleMain: UILabel = {
        let label = UILabel()
        label.text = "AI Recommendations on times and days for posting sounds in this month in your country"
        label.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    
    ///TextFild Account Link
    private lazy var accountLinkTextField: UITextField = {
        let atrubbutedText = NSMutableAttributedString(string: "Enter your account Link")
        atrubbutedText.setTextColor(color: .gray, toSubstring: "Enter your account Link")
        
        let textField = UITextField()
        textField.attributedPlaceholder = atrubbutedText
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.3
        textField.layer.cornerRadius = 16
        textField.backgroundColor = .tableViewColorr
        textField.textColor = .black
        textField.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        
        //Create Button Search
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.tintColor = .gray
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        //paddingView.backgroundColor = .red
        paddingView.addSubview(button) //inside padding
        
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return textField
    }()
    
    ///Country
    private lazy var drobButtonCountry: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "🇺🇸 United States"
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { parametr in
            var outgoing = parametr
            outgoing.font = UIFont(name: "Montserrat-SemiBold", size: 14)
            return outgoing
        }
        
        let originalImage = UIImage(named: "DrobMenu")
        let resizedImage = originalImage?.resized(to: CGSize(width: 10, height: 10))
        config.image = resizedImage
        
        config.imagePlacement = .trailing
        config.imagePadding = 10
        
        let button = UIButton(configuration: config)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 15
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapDropDownCountry), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        return button
    }()
    
    ///Category
    private lazy var drobButtonCategory: UIButton = {
        var config = UIButton.Configuration.plain()
        config.title = "Category"
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { parametr in
            var outgoing = parametr
            outgoing.font = UIFont(name: "Montserrat-SemiBold", size: 14)
            return outgoing
        }
        
        //Image
        let originalImage = UIImage(named: "DrobMenu")
        let resizedImage = originalImage?.resized(to: CGSize(width: 10, height: 10))
        config.image = resizedImage
        
        config.imagePlacement = .trailing
        config.imagePadding = 50
        
        let button = UIButton(configuration: config)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.2
        button.layer.cornerRadius = 15
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapDropDownCategory), for: .touchUpInside)
        
        return button
    }()
    
    ///TableView
    private lazy var dropDownTableView: UITableView = {
        let tableViewDropDown = UITableView()
        tableViewDropDown.dataSource = self
        tableViewDropDown.delegate = self
        tableViewDropDown.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewDropDown.backgroundColor = .viewColorr
        
        tableViewDropDown.tintColor = .black
        tableViewDropDown.layer.cornerRadius = 20
        
        return tableViewDropDown
    }()
    
    ///StackView
    private lazy var dropDownsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 31
        
        stackView.addArrangedSubview(drobButtonCountry)
        stackView.addArrangedSubview(drobButtonCategory)
        
        return stackView
    }()
    
    ///Fruquecy
    private lazy var frequencyLabel: UILabel = {
        let label = UILabel()
        label.text = "Frequency: "
        
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Time Week
    private lazy var timeWeekLabel: UILabel = {
        let label = UILabel()
        let atributeString = NSMutableAttributedString(string: "3 times a week")
        atributeString.underline(subString: "3 times a week", style: .single)
        
        label.attributedText = atributeString
        label.textColor = .labelColorr
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Button Question
    private lazy var questionButtonOne: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let originalImage = UIImage(systemName: "questionmark.circle")
        let resizedImage = originalImage?.resized(to: CGSize(width: 18, height: 18))
        let tintColorImage = resizedImage?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        config.image = tintColorImage
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5) //
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    ///Duration
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "Duration: "
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Minute
    private lazy var minuteLabel: UILabel = {
        let label = UILabel()
        let atributeString = NSMutableAttributedString(string: "2 min")
        atributeString.underline(subString: "2 min", style: .single)
        
        label.attributedText = atributeString
        label.textColor = .labelColorr
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///Button Question
    private lazy var questionButtonTwo: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let originalImage = UIImage(systemName: "questionmark.circle")
        let resizedImage = originalImage?.resized(to: CGSize(width: 18, height: 18))
        let tintColorImage = resizedImage?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        
        config.image = tintColorImage
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    ///StackView Fruquecy, Question
    private lazy var fruquecyQuestionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.addArrangedSubview(frequencyLabel)
        stackView.addArrangedSubview(timeWeekLabel)
        stackView.addArrangedSubview(questionButtonOne)
        
        return stackView
    }()
    
    ///StackView Duration, Minute
    private lazy var durationMinuteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(minuteLabel)
        stackView.addArrangedSubview(questionButtonTwo)
        
        return stackView
    }()
    
    ///StackView  Frequency, Duration
    private lazy var fruquencyDurationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = -90
        
        stackView.addArrangedSubview(fruquecyQuestionStackView)
        //stackView.addArrangedSubview(lineLabel)
        stackView.addArrangedSubview(durationMinuteStackView)
        
        return stackView
    }()
    
    ///StackView Main
    private lazy var dropDownAndTitleStackViewMain: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        //stackView.spacing = 10
        
        stackView.addArrangedSubview(titleMain)
        stackView.addArrangedSubview(accountLinkTextField)
        stackView.addArrangedSubview(dropDownsStackView)
        stackView.addArrangedSubview(fruquencyDurationStackView)
        
        return stackView
    }()
    
    //MARK: - UICollectionView
//    private lazy var collectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        
//    }()
    
  
    
    //MARK:  - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(navigationBarStackViewMain)
        createNavigationBarStackViewMainConstrains()
        
        view.addSubview(dropDownAndTitleStackViewMain)
        createDropDownAndTitleAndTableViewStackView()
        
        presenter = HomePresenter() //presenter = HomePresenter() создаёт этот объект, чтобы HomeViewController мог взаимодействовать с ним.
        presenter?.view = self //Инициализируете HomePresenter в HomeViewController и устанавливаете его view как self, чтобы Presenter мог взаимодействовать с HomeViewController.
        
        view.addSubview(dropDownTableView)
        
        //Hide Keyboard
        accountLinkTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false //No block tap
        view.addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Objc
    @objc private func tapDropDownCountry() {
        toggleDropDownMenu()
    }
    
    @objc private func tapDropDownCategory() {
        presenter?.didTapDropDownCategory()
    }
    
    @objc private func hideKeyboard() {
        accountLinkTextField.resignFirstResponder()
    }
    
    private func toggleDropDownMenu() {
        dropDownTableView.isHidden.toggle()
        updateDropDownTableViewConstraints()
    }
    
    private func updateDropDownTableViewConstraints() {
        dropDownTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownTableView.topAnchor.constraint(equalTo: dropDownsStackView.bottomAnchor),
            dropDownTableView.leadingAnchor.constraint(equalTo: dropDownsStackView.leadingAnchor),
            dropDownTableView.trailingAnchor.constraint(equalTo: dropDownsStackView.trailingAnchor, constant: -180),
            dropDownTableView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

//MARK:  - Extension
private extension HomeViewController {
    
    ///Create StackView NavigationBar  MAIN Constrains
    func createNavigationBarStackViewMainConstrains() {
        navigationBarStackViewMain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBarStackViewMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            navigationBarStackViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            navigationBarStackViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            navigationBarStackViewMain.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    ///Create StackView, DropDown, Title, TableView
    func createDropDownAndTitleAndTableViewStackView() {
        dropDownAndTitleStackViewMain.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownAndTitleStackViewMain.topAnchor.constraint(equalTo: navigationBarStackViewMain.bottomAnchor, constant: 24),
            dropDownAndTitleStackViewMain.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            dropDownAndTitleStackViewMain.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            dropDownAndTitleStackViewMain.heightAnchor.constraint(equalToConstant: 180) //потом умеши
        ])
    }
}

//MARK: - UITableView Dropdown menu
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .viewColorr
        cell.textLabel?.text = options[indexPath.row]
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drobButtonCountry.setTitle(options[indexPath.row], for: .normal)
        dropDownTableView.isHidden = true
    }
}

//MARK: - Hide Keyboard Return
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//MARK: - UIImage Change
extension UIImage {
    func resized(to targetSize: CGSize) -> UIImage? {
        let size = self.size
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        let rect = CGRect(origin: .zero, size: newSize)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

#Preview {
    HomeViewController()
}

