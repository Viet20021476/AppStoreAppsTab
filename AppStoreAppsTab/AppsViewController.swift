//
//  ViewController.swift
//  AppStoreAppsTab
//
//  Created by vietnd1 on 21/8/24.
//

import UIKit

class AppsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    var arrCategories = Observable([Category]())
    var arrBanners = Observable([Banner]())
    var arrApps = Observable([App]())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        setupData()
        setupBindings()
    }
    
    private func setupData() {
        for i in 0...10 {
            arrCategories.value.append(Category(image: "cloudy", description: "Weather"))
            arrBanners.value.append(Banner(firstDes: "Vietnam", secondDes: "Travel", thirdDes: "Around the world", image: "VN_Nature"))
            arrApps.value.append(App(icon: "apple-logo", appName: "iOS", description: "Most powerful OS in the world"))
        }
    }
    
    private func setupBindings() {
        arrCategories.bind { [weak self] _ in
            guard let wSelf = self else { return }
            wSelf.collectionView.reloadSections(IndexSet(integer: 0))
        }
        
        arrBanners.bind { [weak self] _ in
            guard let wSelf = self else { return }
            wSelf.collectionView.reloadSections(IndexSet(integer: 1))
        }
        
        arrCategories.bind { [weak self] _ in
            guard let wSelf = self else { return }
            wSelf.collectionView.reloadSections(IndexSet(integer: 2))
        }
    }
    
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        collectionView.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: BannerCell.reuseIdentifier)
        collectionView.register(UINib(nibName: "AppsCell", bundle: nil), forCellWithReuseIdentifier: AppsCell.reuseIdentifier)
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0:
                return self.createCategorySection()
            case 1:
                return self.createBannerSection()
            case 2:
                return self.createAppsSection()
            default:
                return nil
            }
        }
    }
    
    private func createCategorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(120), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        
        section.interGroupSpacing = 10
        
        return section
    }
    
    private func createBannerSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .estimated(300))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 8
        
        return section
    }
    
    private func createAppsSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.33))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.interGroupSpacing = 8
        
        return section
    }
}


extension AppsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return arrCategories.value.count
        case 1:
            return arrBanners.value.count
        case 2:
            return arrApps.value.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
            let category = arrCategories.value[indexPath.row]
            
            cell.set(category: category)
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCell.reuseIdentifier, for: indexPath) as? BannerCell else { return UICollectionViewCell() }
            let banner = arrBanners.value[indexPath.row]
            
            cell.set(banner: banner)
            
            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsCell.reuseIdentifier, for: indexPath) as? AppsCell else { return UICollectionViewCell() }
            let app = arrApps.value[indexPath.row]
            
            cell.set(app: app)
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}


