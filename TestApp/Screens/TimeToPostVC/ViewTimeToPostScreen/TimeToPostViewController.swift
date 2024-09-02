//
//  HomeViewController.swift
//  TestApp
//
//  Created by Max on 26.08.2024.
//

import UIKit

final class TimeToPostViewController: UIViewController {
    
    //presenter — это ссылка на объект HomePresenter, который обрабатывает логику
    //MARK: Presenter
    private var presenter: TimeToPostPresenter?
    
    
    //private var IS LOADING = false
    // хайт LOADING
    //MARK: Example Country
    private var country: [CountryModel] = []
    private var category: [CategoryModel] = []
    
    let days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    let times = ["", "", "", "", "", "", ""]
    
    private var selectedIndexPath: IndexPath? //создал для храненние выбранной ячейки
    
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
        let atributeString = NSMutableAttributedString(string: "AI Recommendations on times and days for posting sounds in this month in your country")
        
        atributeString.setTextColor(color: UIColor.labelColorr, toSubstring: "this month")
        atributeString.setTextColor(color: UIColor.labelColorr, toSubstring: "your country")
        
        label.textColor = .white
        label.attributedText = atributeString
        label.font = UIFont(name: "Montserrat-SemiBold", size: 15)
        label.numberOfLines = 0
        
        return label
    }()
    
    ///TextFild Account Link
    private lazy var accountLinkTextField: UITextField = {
        let atrubbutedText = NSMutableAttributedString(string: "Enter your account Link")
        atrubbutedText.setTextColor(color: .gray, toSubstring: "Enter your account Link")
        
        let textField = UITextField()
        textField.attributedPlaceholder = atrubbutedText
        textField.borderStyle = .none
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 0.3
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .navigationTabBar
        textField.textColor = .white
        textField.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        textField.addTarget(self, action: #selector(tapTextField), for: .touchDown)
        textField.addTarget(self, action: #selector(endEditingTextField), for: .editingDidEnd)
        
        //Create Button Search
        let buttonLeft = UIButton(type: .custom)
        buttonLeft.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        buttonLeft.tintColor = .labelColorr
        buttonLeft.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let paddingViewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        //paddingView.backgroundColor = .red
        paddingViewLeft.addSubview(buttonLeft) //inside padding
        
        textField.leftView = paddingViewLeft
        textField.leftViewMode = .always
        
        
        let buttonRight = UIButton(type: .custom)
        buttonRight.addTarget(self, action: #selector(tapButtonRight), for: .touchUpInside)
        buttonRight.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        buttonRight.tintColor = .gray
        buttonRight.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        
        let paddingViewRight = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        //paddingViewRight.backgroundColor = .red
        paddingViewRight.addSubview(buttonRight)
        
        
        
        textField.rightView = paddingViewRight
        textField.rightViewMode = .whileEditing //`rightViewMode` определяет, когда будет показан вид в правой части текстового поля.
        
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
        button.layer.borderWidth = 0.3
        button.layer.cornerRadius = 16
        button.tintColor = .white
        button.backgroundColor = .navigationTabBar
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
        let resizedImage = originalImage?.resized(to: CGSize(width: 15, height: 10))
        config.image = resizedImage
        
        config.imagePlacement = .trailing
        config.imagePadding = 50
        
        let button = UIButton(configuration: config)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 0.3
        button.layer.cornerRadius = 16
        button.tintColor = .white
        button.backgroundColor = .navigationTabBar
        button.addTarget(self, action: #selector(tapDropDownCategory), for: .touchUpInside)
        
        return button
    }()
    
    ///TableView Country
    private lazy var dropDownCountryTableView: UITableView = {
        let tableViewDropDown = UITableView()
        tableViewDropDown.dataSource = self
        tableViewDropDown.delegate = self
        tableViewDropDown.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewDropDown.backgroundColor = .navigationTabBar
        
        tableViewDropDown.tintColor = .black
        tableViewDropDown.layer.cornerRadius = 20
        
        return tableViewDropDown
    }()
    
    ///TableView Category
    private lazy var dropDownCategoryTableView: UITableView = {
        let tableViewDropDown = UITableView()
        tableViewDropDown.dataSource = self
        tableViewDropDown.delegate = self
        tableViewDropDown.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewDropDown.backgroundColor = .navigationTabBar
        
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
        
        let originalImage = UIImage(systemName: "questionmark.circle.fill")
        let resizedImage = originalImage?.resized(to: CGSize(width: 18, height: 18))
        let tintColorImage = resizedImage?.withTintColor(.labelColorr, renderingMode: .alwaysOriginal)
        
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
        
        let originalImage = UIImage(systemName: "questionmark.circle.fill")
        let resizedImage = originalImage?.resized(to: CGSize(width: 18, height: 18))
        let tintColorImage = resizedImage?.withTintColor(.labelColorr, renderingMode: .alwaysOriginal)
        
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
    
    ///Days
    private lazy var collectionViewDays: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    ///Time
    private lazy var collectionViewTime: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        
        return collectionView
    }()
    
    ///StackView Days, Time
    private lazy var collectionViewDaysAndTimeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(collectionViewDays)
        stackView.addArrangedSubview(collectionViewTime)
        
        
        return stackView
    }()
    
    ///Image Notification
    private lazy var activateNotificationImage: UIButton = {
        var config = UIButton.Configuration.plain()
        
        let originalImage = UIImage(named: "EmailImage")
        let resizedImage = originalImage?.resized(to: CGSize(width: 18, height: 18))
        let tintColorImage = resizedImage?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        config.image = tintColorImage
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        let button = UIButton(configuration: config)
        
        return button
    }()
    
    ///Label Notification
    private lazy var notificationLabel: UILabel = {
        let label = UILabel()
        label.text = "Activate notifications"
        label.textColor = .white
        label.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        label.numberOfLines = 0
        
        return label
    }()
    
    /// StackView Notification Image, Label
    private lazy var notificationImageAndLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.addArrangedSubview(activateNotificationImage)
        stackView.addArrangedSubview(notificationLabel)
        
        return stackView
    }()
    
    ///Button Notification
    private lazy var activateNotificationButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .navigationTabBar
        button.layer.cornerRadius = 20
        
        button.addSubview(notificationImageAndLabelStackView)
        
        notificationImageAndLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notificationImageAndLabelStackView.topAnchor.constraint(equalTo: button.topAnchor),
            notificationImageAndLabelStackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -60),
            notificationImageAndLabelStackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 90),
            notificationImageAndLabelStackView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
            
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return button
    }()
    
    private func updateUI() {
        // Получение данных из презентера
        country = presenter?.getCountries() ?? []
        category = presenter?.getCategory() ?? []
        // Здесь можно обновить UI с полученными данными
        // Например, обновить таблицу или другие элементы интерфейса
    }
    
    
    //MARK:  - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(navigationBarStackViewMain)
        createNavigationBarStackViewMainConstrains()
        
        view.addSubview(collectionViewDaysAndTimeStackView)
        createCollectionViewStackViewContraints()
        
        view.addSubview(dropDownAndTitleStackViewMain)
        createDropDownAndTitleAndTableViewStackView()
        
        /*
         •    private var presenter: TimeToPostPresenter?: Это как пустая коробка, которая может содержать объект.
         •    presenter = TimeToPostPresenter(): Это как заполнение коробки конкретным объектом.

     Сначала коробка пустая, а потом мы кладём в неё что-то конкретное.
        */
        presenter = TimeToPostPresenter() //presenter = HomePresenter() создаёт этот объект, чтобы HomeViewController мог взаимодействовать с ним.
        
        //presenter?.view = self позволяет презентеру работать с вашим контроллером. Это нужно, чтобы презентер мог обновлять интерфейс или получать данные из вашего контроллера.
        
        //Прямо после создания презентера (presenter = TimeToPostPresenter()), он ещё не знает о вашем контроллере. presenter?.view = self связывает презентер с вашим контроллером, чтобы он мог взаимодействовать с ним.
        presenter?.view = self
        updateUI()
        
        view.addSubview(dropDownCountryTableView)
        view.addSubview(dropDownCategoryTableView)
        
        //Hide Keyboard
        accountLinkTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false //No block tap
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(activateNotificationButton)
        createActivateNotificationButtonConstrains()
        
        
        
    }
    
    //MARK: - Objc
    @objc private func tapDropDownCountry() {
        dropDownCountryTableView.isHidden.toggle()
        createUpdateDropDownTableViewСountriesConstraints()
    }
    
    @objc private func tapDropDownCategory() {
        dropDownCategoryTableView.isHidden.toggle()
        createUpdateDropDownTableViewСategoryConstraints()
    }
    
    @objc private func hideKeyboard() {
        accountLinkTextField.resignFirstResponder()
    }
    
    @objc private func tapTextField() {
        if accountLinkTextField.isEnabled {
            accountLinkTextField.layer.borderColor = UIColor.labelColorr.cgColor
        } else {
            accountLinkTextField.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    @objc private func endEditingTextField() {
        accountLinkTextField.layer.borderColor = UIColor.gray.cgColor
    }
    
    ///TextField Clear Button Right
    @objc private func tapButtonRight() {
        accountLinkTextField.text = ""
    }
    
    
 
}

//MARK:  - Extension
private extension TimeToPostViewController {
    
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
    
    //MARK: - UICollection Constrains
    private func createCollectionViewStackViewContraints() {
        collectionViewDaysAndTimeStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionViewDaysAndTimeStackView.topAnchor.constraint(equalTo: navigationBarStackViewMain.bottomAnchor , constant: 210),
            collectionViewDaysAndTimeStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            collectionViewDaysAndTimeStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            
            collectionViewDays.heightAnchor.constraint(equalToConstant: 35),
            //collectionViewTime.heightAnchor.constraint(equalToConstant: 250),
            
        ])
    }
    
    private func createActivateNotificationButtonConstrains() {
        activateNotificationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activateNotificationButton.topAnchor.constraint(equalTo: collectionViewDaysAndTimeStackView.bottomAnchor, constant: 12),
            activateNotificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            activateNotificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            activateNotificationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,  constant: -12)
        ])
    }
    
    ///Constrains Table View Сountries
    private func createUpdateDropDownTableViewСountriesConstraints() {
        dropDownCountryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownCountryTableView.topAnchor.constraint(equalTo: dropDownsStackView.bottomAnchor),
            dropDownCountryTableView.leadingAnchor.constraint(equalTo: dropDownsStackView.leadingAnchor),
            dropDownCountryTableView.trailingAnchor.constraint(equalTo: dropDownsStackView.trailingAnchor, constant: -180),
            dropDownCountryTableView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    ///Constrains Table View Category
    private func createUpdateDropDownTableViewСategoryConstraints() {
        dropDownCategoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dropDownCategoryTableView.topAnchor.constraint(equalTo: dropDownsStackView.bottomAnchor),
            dropDownCategoryTableView.leadingAnchor.constraint(equalTo: dropDownsStackView.leadingAnchor, constant: 180),
            dropDownCategoryTableView.trailingAnchor.constraint(equalTo: dropDownsStackView.trailingAnchor),
            dropDownCategoryTableView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    
}

//MARK: - UITableView Dropdown menu
extension TimeToPostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == dropDownCountryTableView {
            return country.count
        } else if tableView == dropDownCategoryTableView {
            return category.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = .navigationTabBar
        
        if tableView == dropDownCountryTableView {
            cell.textLabel?.text = country[indexPath.row].name //country[indexPath.row].name — это способ получить имя страны из массива country на основе выбранного индекса.
        } else if tableView == dropDownCategoryTableView {
            cell.textLabel?.text = category[indexPath.row].name
        }
      
        
        cell.textLabel?.textColor = .white
        
        cell.textLabel?.font = UIFont(name: "Montserrat-SemiBold", size: 13)
        
        if indexPath == selectedIndexPath {
            cell.contentView.backgroundColor = .labelColorr
            cell.textLabel?.textColor = .black
        }
        
        return cell
    }
}

extension TimeToPostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == dropDownCountryTableView {
            drobButtonCountry.setTitle(country[indexPath.row].name, for: .normal)
            dropDownCountryTableView.isHidden = true
            
            
        } else if tableView == dropDownCategoryTableView {
            drobButtonCategory.setTitle(category[indexPath.row].name, for: .normal)
            dropDownCategoryTableView.isHidden = true
        }
      
       
        
        selectedIndexPath = indexPath
        
        tableView.reloadData()
        
      
    }
}

//MARK: - UICollectionView
extension TimeToPostViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewDays {
            return days.count
        } else {
            return times.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .navigationTabBar
        cell.time.textColor = .white
        cell.time.font = UIFont(name: "Montserrat-SemiBold", size: 12)
        
        if collectionView == collectionViewDays {
            cell.time.text = days[indexPath.row]
        } else {
            cell.time.text = times[indexPath.row]
        }
        
        //View + Label = Constains
        switch indexPath.row {
        case 0:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "5 am" //проверить страну (выюрана категория) Словарь (сохраниене )
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 1:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "6 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 60),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 2:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "7 pm"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 220),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 3:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "7 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 120),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 4:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "6 pm"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 280),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 5:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "5 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        case 6:
            let customView = CustomViewTime()
            
            if collectionView == collectionViewTime {
                cell.contentView.addSubview(customView)
                customView.label.text = "9 am"
                customView.label.textColor = .black
                customView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    customView.topAnchor.constraint(equalTo: cell.contentView.topAnchor, constant: 170),
                    customView.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                    customView.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                    customView.heightAnchor.constraint(equalToConstant: 40)
                ])
            }
        default:
            break
        }
        
        if indexPath.row == 5 && collectionView == collectionViewDays {
            let view = UIView()
            view.backgroundColor = .collectionViewBlue
            view.alpha = 0.2
            
            view.backgroundColor = collectionView == collectionViewDays ? .collectionViewBlue : .collectionViewBlue
            view.alpha = 0.2
            
            cell.time.textColor = collectionView == collectionViewDays ? .collectionViewBlue : .collectionViewBlue
            cell.contentView.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                view.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                view.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                view.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            ])
        } else if indexPath.row == 6 && collectionView == collectionViewDays {
            let view = UIView()
            view.backgroundColor = collectionView == collectionViewDays ? .collectionViewRed : .collectionViewRed
            view.alpha = 0.2
            view.frame = cell.contentView.bounds
            cell.time.textColor = collectionView == collectionViewDays ? .collectionViewRed : .collectionViewRed
            cell.contentView.addSubview(view)
        }
        
        return cell
    }
}

extension TimeToPostViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == collectionViewDays {
            let width = (collectionView.bounds.width - 10) / 7
            return CGSize(width: width, height: 36)
        } else {
            let width = (collectionView.bounds.width - 10) / 7
            return CGSize(width: width, height: 350)
        }
    }
}

//MARK: - Hide Keyboard Return
extension TimeToPostViewController: UITextFieldDelegate {
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
    TimeToPostViewController()
}

