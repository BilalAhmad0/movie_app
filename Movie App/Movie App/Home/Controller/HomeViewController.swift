//
//  HomeViewController.swift
//  Movie App
//
//  Created by Bilal Ahmad on 29/03/2024.
//

import UIKit
import AVKit
import AVFoundation

final class HomeViewController: UIViewController {
    
    // Store properties
    var seasons: [Seasons] = []
    
    
    /// main slider view
    private let sliderImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = Image.defaultBannerImage
//        iv.loadImage(from: URL(string: "https://www.sho.com/billions/kzCsLBzGhBK19zNcAVJxICAIcJq.jpg")! )
        let shadowView = UIView()
        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        shadowView.setHeight(20)
        iv.addSubview(shadowView)
        shadowView.anchor(left: iv.leftAnchor, bottom: iv.bottomAnchor, right: iv.rightAnchor)
        
        iv.setHeight(150)
        return iv
    }()
    
    /// back button
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(Image.chevronLeft, for: .normal)
        button.setDimensions(height: 25, width: 30)
        return button
    }()
    
    /// search button
    private lazy var searchBar: UIButton = {
        let button = UIButton()
        button.setImage(Image.searchIcon, for: .normal)
        button.setDimensions(height: 30, width: 30)
        return button
    }()
    
    ///  main header view
    private lazy var headerView: HomeHeaderView = {
        let view = HomeHeaderView()
        view.delegate = self
        return view
    }()
    
    ///  collection view
    private lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        
        // Registers cell
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        collectionView.register(SeasonCollectionViewCell.self, forCellWithReuseIdentifier: SeasonCollectionViewCell.reuseIdentifier)
        
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = Colors.appBackgroundColor
        collectionView.dataSource = self
        collectionView.delegate = self
    
        
        return collectionView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        TVShowService.shared.fetchTVShow(id: 62852) { result in
            guard case .success(let tvShow) = result, let seasons = tvShow.seasons else {
                if case .failure(let error) = result {
                    print("Failed to fetch TV show: \(error)")
                } else {
                    print("Seasons array is nil")
                }
                return
            }
            self.seasons = seasons
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    }
    
    // setup views and constraints
    private func setupView(){
        view.backgroundColor = Colors.appBackgroundColor
        
        /// main slider view
        view.addSubview(sliderImageView)
        
        /// back button
        sliderImageView.addSubview(backButton)
        
        /// seach button
        sliderImageView.addSubview(searchBar)
        
        /// header view
        view.addSubview(headerView)
        
        /// collection view
        view.addSubview(collectionView)
        
        layoutConstraints()
        
    }
    
    private func layoutConstraints(){
        
        /// main slider view
        sliderImageView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20)
        
        /// back button
        backButton.anchor(top: sliderImageView.topAnchor, left: sliderImageView.leftAnchor, paddingTop: 10, paddingLeft: 20)
        
        /// seach button
        searchBar.anchor(top: sliderImageView.topAnchor, right: sliderImageView.rightAnchor, paddingTop: 10, paddingRight: 20)
        
        /// header view
        headerView.anchor(top: sliderImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -10)
        
        /// collection view
        collectionView.anchor(top: headerView.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 10)
    }
    
    
    // compositional layout
    private func createLayout() -> UICollectionViewLayout
    {
        let layout = UICollectionViewCompositionalLayout {[weak self] (sectionIndex, _) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil}
            
            if sectionIndex == 0 {
                return self.createSeasonSection()
            }
            else{
                return self.createEpisodeSection()
            }
        }
        return layout
    }
    
    private func createSeasonSection() -> NSCollectionLayoutSection {
        
        let seasonItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .absolute(50))
        seasonItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        // season items group
        let seasonGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(70), item: seasonItem, count: 3)
        
        let section = NSCollectionLayoutSection(group: seasonGroup)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createEpisodeSection() -> NSCollectionLayoutSection {
        
        let episodeItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1))
        episodeItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5)
        
        let episodeGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .estimated(800), item: episodeItem, count: 10)
        
        let section = NSCollectionLayoutSection(group: episodeGroup)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
}

// MARK: - Collection View DataSource

extension HomeViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? seasons.count : 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeasonCollectionViewCell.reuseIdentifier, for: indexPath) as! SeasonCollectionViewCell
            cell.configureCell(seasons[indexPath.row])
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as! HomeCollectionViewCell
            cell.configureCell()
            return cell
        }
        
    }
    
}

// MARK: - Collection View Delegate
extension HomeViewController: UICollectionViewDelegate{
    
}


// MARK: - Header View button delegates
extension HomeViewController: HomeHeaderViewDelegate{
    func didTappedOnPlay() {
        guard let videoURL = URL(string: App.VIDEO_URL) else {
            print("Invalid video URL")
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        
        present(playerViewController, animated: true) {
            player.play()
        }
        
    }
    
}
