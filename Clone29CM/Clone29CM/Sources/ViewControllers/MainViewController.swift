//
//  ViewController.swift
//  Clone29CM
//
//  Created by 이예슬 on 8/19/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

import AnimatedCollectionViewLayout

class MainViewController: UIViewController {
    
    //MARK: Custom Properties
    
    var bannerImageNameList: [String] = ["bannerImg1","bannerImg3","bannerImg4","bannerImg5","bannerImg6","bannerImg7","bannerImg8","bannerImg9","bannerImg10","bannerImg11","bannerImg12"]
    var menuLabelNameList: [String] = ["전체","우먼","맨","라이프","클린뷰티"]
    
    var bannerInitialTopConstraintConstant: CGFloat!
    struct MenuTabName{
        
        static let all = "전체"
        static let women = "우먼"
        static let men = "맨"
        static let life = "라이프"
        static let cleanBeauty = "클린뷰티"
        
    }
    let initialHeight: CGFloat = 510
    let layout = AnimatedCollectionViewLayout()
    
    //MARK: IBOutlets
    
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var mainBannerCollectionView : UICollectionView!
    @IBOutlet weak var menuTabCollectionView: UICollectionView!
    @IBOutlet weak var bannerTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bannerHeightConstraint: NSLayoutConstraint!
    
    
    //MARK: LifeCycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainBannerCollectionView.dataSource = self
        mainBannerCollectionView.delegate = self
        menuTabCollectionView.delegate = self
        menuTabCollectionView.dataSource = self
        layout.animator = ParallaxAttributesAnimator()
        layout.scrollDirection = .horizontal
        mainBannerCollectionView.collectionViewLayout = layout
        
        menuTabCollectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: .bottom)
        //mainTableView.contentInset = UIEdgeInsets(top: -initialHeight,left:0,bottom:0,right:0)
    }


}
// 컬렉션뷰
extension MainViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainBannerCollectionView{
            return bannerImageNameList.count
        }
        else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainBannerCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainBannerCollectionViewCell", for: indexPath) as? MainBannerCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.bannerImageView.image = UIImage(named:bannerImageNameList[indexPath.item])
            return cell
        }
        else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuTabCollectionViewCell", for: indexPath) as? MenuTabCollectionViewCell else{
                return UICollectionViewCell()
            }
            if indexPath.item == 4{
                cell.menuLabel.textColor = UIColor(red: 153/225, green: 0, blue: 0, alpha: 1)
            }
            cell.menuLabel.text = menuLabelNameList[indexPath.item]
            return cell
        }
        
    }
    
}

extension MainViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainBannerCollectionView{
            return CGSize(width: 375, height: 510)
        }
        else{
            return CGSize(width: 50, height: 85)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainBannerCollectionView{
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right:0 )
        }
        else{
            return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == mainBannerCollectionView{
            return 0
        }
        else{
            return 30
        }
        
    }
    //셀 간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
        
    }
}

extension MainViewController: UICollectionViewDelegate{
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        
        if  mainBannerCollectionView.contentOffset.x > 375*10{
            let nextIndex = IndexPath(item: 0, section: 0)
            mainBannerCollectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: true)
        }
        else if mainBannerCollectionView.contentOffset.x < 0 {
            let nextIndex = IndexPath(item: 10, section: 0)
            mainBannerCollectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally , animated: true)
            
            
        }
    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print(mainBannerCollectionView.contentOffset.x)
//
}

// 테이블뷰
extension MainViewController: UITableViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffsetY = -scrollView.contentOffset.y
        
        mainBannerCollectionView.translatesAutoresizingMaskIntoConstraints = false

        

        
        
//        if contentOffsetY + initialHeight > 88 {
//            NSLayoutConstraint.activate([self.mainBannerCollectionView.heightAnchor.constraint(equalToConstant: initialHeight + contentOffsetY)])
//        }
//        else {
//            NSLayoutConstraint.activate([self.mainBannerCollectionView.heightAnchor.constraint(equalToConstant: 88)])
//        }
        print(scrollView.contentOffset.y)
        print(mainBannerCollectionView.contentOffset.y)
        scrollView.setNeedsLayout()
        scrollView.layoutIfNeeded()
    
        
//        if (0 < scrollView.contentOffset.y && scrollView.contentOffset.y < 510){
//            bannerTopConstraint.constant = -scrollView.contentOffset.y
//        }
//        else if scrollView.contentOffset.y == 0{
//            bannerTopConstraint.constant = 0
//        }
//        else{
//            bannerTopConstraint.constant = -510
//        }
        
    }
}

extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as? MainTableViewCell else{
            return UITableViewCell()
        }
        return cell

    }
    
    
}

