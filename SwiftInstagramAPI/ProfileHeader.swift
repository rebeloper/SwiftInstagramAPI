//
//  ProfileHeader.swift
//  SwiftInstagramAPI
//
//  Created by Alex Nagy on 07/12/2018.
//  Copyright © 2018 Alex Nagy. All rights reserved.
//

import TinyConstraints

class ProfileHeader: UIView {
    
    // MARK: -
    // MARK: Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -
    // MARK: Common Init
    
    private func commonInit() {
        setupViews()
    }
    
    // MARK: -
    // MARK: Setup Views
    
    private func setupViews() {
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(fullNameLabel)
        addSubview(bioTextView)
        addSubview(websiteLabel)
        addSubview(containerCountViews)
        addSubview(containerViews)
        addSubview(containerDifViews)
        
        profileImageView.topToSuperview(offset: 10, usingSafeArea: true)
        profileImageView.leadingToSuperview(offset: 10, usingSafeArea: true)
        profileImageView.width(profileImageViewHeight)
        profileImageView.height(profileImageViewHeight)
        
        fullNameLabel.topToBottom(of: profileImageView, offset: 8)
        fullNameLabel.leadingToSuperview(offset: 10, usingSafeArea: true)
        fullNameLabel.trailingToSuperview(offset: 10, usingSafeArea: true)
        
        bioTextView.topToBottom(of: fullNameLabel, offset: 0)
        bioTextView.leadingToSuperview(offset: 5, usingSafeArea: true)
        bioTextView.trailingToSuperview(offset: 5, usingSafeArea: true)
        bioTextView.height(50)
        
        websiteLabel.topToBottom(of: bioTextView, offset: 4)
        websiteLabel.leadingToSuperview(offset: 10, usingSafeArea: true)
        websiteLabel.trailingToSuperview(offset: 10, usingSafeArea: true)
        
        containerCountViews.topToSuperview(offset: 24, usingSafeArea: true)
        containerCountViews.leadingToTrailing(of: profileImageView, offset: 8)
        containerCountViews.trailingToSuperview(offset: 10, usingSafeArea: true)
        containerCountViews.height(16)
        let screenWidth = UIScreen.main.bounds.width
        postsCountView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        followersCountView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        //        followingCountView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        containerCountViews.stack([postsCountView, followersCountView, followingCountView], axis: .horizontal)
        
        containerViews.topToBottom(of: containerCountViews, offset: 0)
        containerViews.leadingToTrailing(of: profileImageView, offset: 8)
        containerViews.trailingToSuperview(offset: 10, usingSafeArea: true)
        containerViews.height(16)
        postsView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        followersView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        //        followingView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        containerViews.stack([postsView, followersView, followingView], axis: .horizontal)
        
        containerDifViews.topToBottom(of: containerViews, offset: 0)
        containerDifViews.leadingToTrailing(of: profileImageView, offset: 8)
        containerDifViews.trailingToSuperview(offset: 10, usingSafeArea: true)
        containerDifViews.height(16)
        postsDifView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        followersDifView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        //        followingDifView.width((screenWidth - profileImageViewHeight - 10 - 10 - 10) / 3)
        containerDifViews.stack([postsDifView, followersDifView, followingDifView], axis: .horizontal)
    }
    
    // MARK: -
    // MARK: Views
    
    let profileImageViewHeight: CGFloat = 80
    lazy var profileImageView: UIImageView = {
        var iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = profileImageViewHeight / 2
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var fullNameLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var bioTextView: UITextView = {
        var tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 14)
        return tv
    }()
    
    lazy var websiteLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var postsCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var postsCountView: UIView = {
        var view = UIView()
        view.addSubview(postsCountLabel)
        postsCountLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followersCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var followersCountView: UIView = {
        var view = UIView()
        view.addSubview(followersCountLabel)
        followersCountLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followingCountLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var followingCountView: UIView = {
        var view = UIView()
        view.addSubview(followingCountLabel)
        followingCountLabel.edgesToSuperview()
        return view
    }()
    
    lazy var containerCountViews: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var postsLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "posts"
        return label
    }()
    
    lazy var postsView: UIView = {
        var view = UIView()
        view.addSubview(postsLabel)
        postsLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followersLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "followers"
        return label
    }()
    
    lazy var followersView: UIView = {
        var view = UIView()
        view.addSubview(followersLabel)
        followersLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followingLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = "following"
        return label
    }()
    
    lazy var followingView: UIView = {
        var view = UIView()
        view.addSubview(followingLabel)
        followingLabel.edgesToSuperview()
        return view
    }()
    
    lazy var containerViews: UIView = {
        var view = UIView()
        return view
    }()
    
    lazy var postsDifLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red: 237/255, green: 20/255, blue: 91/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    lazy var postsDifView: UIView = {
        var view = UIView()
        view.addSubview(postsDifLabel)
        postsDifLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followersDifLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red: 237/255, green: 20/255, blue: 91/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    lazy var followersDifView: UIView = {
        var view = UIView()
        view.addSubview(followersDifLabel)
        followersDifLabel.edgesToSuperview()
        return view
    }()
    
    lazy var followingDifLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor(red: 237/255, green: 20/255, blue: 91/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    lazy var followingDifView: UIView = {
        var view = UIView()
        view.addSubview(followingDifLabel)
        followingDifLabel.edgesToSuperview()
        return view
    }()
    
    lazy var containerDifViews: UIView = {
        var view = UIView()
        return view
    }()
    
    // MARK: -
    // MARK: Handlers
    
    
    // MARK: -
    // MARK: Populate View with Data
    
//    func populate(with instagramUser: InstagramUser?) {
//        guard let instagramUser = instagramUser else { return }
//        
//        let username = instagramUser.username
//        let userInfo = ["username": username]
//        NotificationCenter.default.post(name: notificationNameReloadNavBarUI, object: nil, userInfo: userInfo)
//        
//        let url = instagramUser.profilePicture
//        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, err in
//            if let err = err {
//                print(err.localizedDescription)
//                return
//            }
//            
//            guard let data = data else {
//                return
//            }
//            
//            if let image = UIImage(data: data) {
//                DispatchQueue.main.async {
//                    self.profileImageView.image = image
//                }
//            }
//        }
//        
//        task.resume()
//        
//        self.fullNameLabel.text = instagramUser.fullName
//        if let bio = instagramUser.bio {
//            self.bioTextView.text = bio
//        }
//        if let website = instagramUser.website {
//            self.websiteLabel.text = website
//        }
//        
//        if let counts = instagramUser.counts {
//            
//            let oldPostsCount = UserDefaults.standard.integer(forKey: "oldPostsCount")
//            let oldFollowersCount = UserDefaults.standard.integer(forKey: "oldFollowersCount")
//            let oldFollowingCount = UserDefaults.standard.integer(forKey: "oldFollowingCount")
//            let newPostsCount = counts.media
//            let newFollowersCount = counts.followedBy
//            let newFollowingCount = counts.follows
//            
//            self.postsCountLabel.text = String(newPostsCount)
//            self.followersCountLabel.text = String(newFollowersCount)
//            self.followingCountLabel.text = String(newFollowingCount)
//            
//            let postsCount = newPostsCount - oldPostsCount
//            if newPostsCount >= oldPostsCount {
//                self.postsDifLabel.text = "+\(postsCount)"
//            } else {
//                self.postsDifLabel.text = "\(postsCount)"
//            }
//            
//            let followersCount = newFollowersCount - oldFollowersCount
//            if newFollowersCount >= oldFollowersCount {
//                self.followersDifLabel.text = "+\(followersCount)"
//            } else {
//                self.followersDifLabel.text = "\(followersCount)"
//            }
//            
//            let followingCount = newFollowingCount - oldFollowingCount
//            if newFollowingCount >= oldFollowingCount {
//                self.followingDifLabel.text = "+\(followingCount)"
//            } else {
//                self.followingDifLabel.text = "\(followingCount)"
//            }
//            
//            UserDefaults.standard.set(newPostsCount, forKey: "oldPostsCount")
//            UserDefaults.standard.set(newFollowersCount, forKey: "oldFollowersCount")
//            UserDefaults.standard.set(newFollowingCount, forKey: "oldFollowingCount")
//            UserDefaults.standard.synchronize()
//        }
//        
//    }
}


