//
//  ProfileViewController.swift
//  SwiftInstagramAPI
//
//  Created by Alex Nagy on 07/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import CollectionKit
import TinyConstraints

//let instagramApi = Instagram.shared
let notificationNameReloadMediaUI = Notification.Name(rawValue: "reloadMediaUI")
let notificationNameReloadHeaderUI = Notification.Name(rawValue: "reloadHeaderUI")
let notificationNameReloadNavBarUI = Notification.Name(rawValue: "reloadNavBarUI")

enum CountType {
    case likes, comments
}

var countType: CountType = .likes

class ProfileViewController: CollectionViewController {
    
//    var instagramMediaList: [InstagramMedia] = []
//    var instagramUser: InstagramUser?
    
    // MARK: -
    // MARK: Header Composer Provider
    
    var headerComposer: ComposedHeaderProvider<ProfileHeader>!
    
    // MARK: -
    // MARK: Provider Elements for Section 1
    
//    lazy var dataSource = ArrayDataSource(data: instagramMediaList) // may be [] upon initialization because purchases may not be ready; see `setupNotificationCenterObservers` below
//    lazy var viewSource = ClosureViewSource(viewUpdater: { (view: ImageCell, data: InstagramMedia, index: Int) in
//        view.populate(with: data)
//    })
//    lazy var sizeSource = { (index: Int, data: InstagramMedia, collectionSize: CGSize) -> CGSize in
//        let width = (self.view.frame.width - 2) / 3
//        return CGSize(width: width, height: width)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        setupNavBarItems()
        
        setupNotificationCenterObservers()
        setupProvider()
        
        fetchData()
    }
    
    func fetchData() {
        fetchCurrentUser()
        fetchCurrentMedia(count: 20) // 20 seems to be the limit
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        if !instagramApi.isAuthenticated {
//            navigationController?.pushViewController(AuthViewController(), animated: true)
//        }
    }
    
    lazy var changeCountTypeBarButtonItem: UIBarButtonItem = {
        var item = UIBarButtonItem(title: "Show Comments", style: .plain, target: self, action: #selector(handleChangeCountTypeBarButtonItemTapped))
        return item
    }()
    
    fileprivate func setupNavBarItems() {
        
        let logOutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(handleLogoutBarButtonItemTapped))
        let refreshBarButtonItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(handleRefreshBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(changeCountTypeBarButtonItem, animated: false)
        navigationItem.setRightBarButtonItems([logOutBarButtonItem, refreshBarButtonItem], animated: false)
    }
    
    fileprivate func setupNotificationCenterObservers() {
        NotificationCenter.default.addObserver(forName: notificationNameReloadMediaUI, object: nil, queue: OperationQueue.main) { (notification) in
//            self.dataSource.data = self.instagramMediaList
        }
        
        NotificationCenter.default.addObserver(forName: notificationNameReloadHeaderUI, object: nil, queue: OperationQueue.main) { (notification) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        NotificationCenter.default.addObserver(forName: notificationNameReloadNavBarUI, object: nil, queue: OperationQueue.main) { (notification) in
            DispatchQueue.main.async {
                guard let userInfo = notification.userInfo, let username = userInfo["username"] as? String else { return }
                self.navigationItem.title = username
            }
        }
    }
    
    fileprivate func setupProvider() {
        
        // create a provider for the section 1
//        let section1Provider = BasicProvider(
//            dataSource: dataSource,
//            viewSource: viewSource,
//            sizeSource: sizeSource
//        )
//
//        section1Provider.layout = FlowLayout(spacing: 1)
//
//        // create a sections provider with all the setcions
//        let sectionsProvider = ComposedProvider(sections: [section1Provider])
//
//        // create a composed header provider so we may add the `headerViewSource` and `headerSizeSource` and `sections`
//        let composedProvider = ComposedHeaderProvider(
//            headerViewSource: ClosureViewSource(
//                viewUpdater: { (view: ProfileHeader, data, index) in
//                    view.populate(with: self.instagramUser)
//            }),
//            headerSizeSource: { (index, data, maxSize) -> CGSize in
//                return CGSize(width: maxSize.width, height: 200)
//        },
//            sections: sectionsProvider.sections
//        )
//
//        // so we may access the headerComposer outside of this scope if we need to; for example accessing its `isSticky` property
//        headerComposer = composedProvider
//        // set the `provider` to be newly created `composedProvider`
//        provider = composedProvider
//
//        // set the header to be sticky
//        setHeaderSticky(false)
        
    }
    
    func setHeaderSticky(_ value: Bool) {
        headerComposer.isSticky = value
    }
    
    func fetchCurrentUser() {
//        fetchUser { (instagramUser, err) in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            }
//            
//            guard let instagramUser = instagramUser else {
//                return
//            }
//            
//            self.instagramUser = instagramUser
//            NotificationCenter.default.post(name: notificationNameReloadHeaderUI, object: nil)
//        }
    }
    
//    func fetchUser(completion: @escaping (_ instagramUser: InstagramUser?, _ error: Error?) ->()) {
//        instagramApi.user("self", success: { (instagramUser) in
//            completion(instagramUser, nil)
//        }) { (err) in
//            completion(nil, err)
//        }
//    }
    
    func fetchCurrentMedia(count: Int) {
//        fetchMedia(count: count) { (instagramMediaList, err) in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            }
//
//            guard let instagramMediaList = instagramMediaList else {
//                return
//            }
//
//            self.instagramMediaList = instagramMediaList
//            NotificationCenter.default.post(name: notificationNameReloadMediaUI, object: nil)
//        }
    }
    
//    func fetchMedia(count: Int, completion: @escaping (_ images: [InstagramMedia]?, _ error: Error?) ->()) {
//        instagramApi.recentMedia(fromUser: "self", count: count, success: { mediaList in
//            completion(mediaList, nil)
//        }, failure: { err in
//            completion(nil, err)
//        })
//    }
    
    @objc fileprivate func handleChangeCountTypeBarButtonItemTapped() {
        if countType == .likes {
            countType = .comments
            changeCountTypeBarButtonItem.title = "Show Likes"
        } else {
            countType = .likes
            changeCountTypeBarButtonItem.title = "Show Comments"
        }
        collectionView.reloadData()
    }
    
    @objc fileprivate func handleRefreshBarButtonItemTapped() {
        print("Refreshing...")
        // for testing purposes
//        UserDefaults.standard.set(0, forKey: "oldPostsCount")
//        UserDefaults.standard.set(0, forKey: "oldFollowersCount")
//        UserDefaults.standard.set(0, forKey: "oldFollowingCount")
//        UserDefaults.standard.synchronize()
//        collectionView.reloadData()
        
        fetchData()
    }
    
    @objc fileprivate func handleLogoutBarButtonItemTapped() {
        logout { (result) in
            if result {
                print("Successfully logged out.")
                self.navigationController?.pushViewController(AuthViewController(), animated: true)
            } else {
                print("Failed to log out.")
            }
        }
    }
    
    func logout(completion: @escaping (_ result: Bool) ->()) {
//        if instagramApi.logout() {
//            completion(true)
//        } else {
//            completion(false)
//        }
    }
    
}

