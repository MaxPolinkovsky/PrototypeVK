//
//  PageSwipeController.swift
//  prototypeVK
//
//  Created by Max Polinkovsky on 18.01.2021.
//

import UIKit

class PageSwipeController: UICollectionViewController {
    
    lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .azure
        nextButton.layer.cornerRadius = 15
        nextButton.setTitle("Continiue", for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return nextButton
    }()
    
    lazy var pageControll: UIPageControl = {
       let page = UIPageControl()
        page.currentPage = 0
        page.numberOfPages = Manager.shared.pages.count
        page.currentPageIndicatorTintColor = .black
        page.pageIndicatorTintColor = .gray
        page.translatesAutoresizingMaskIntoConstraints = false
       return page
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        addInSubwues()
        setupLayout()
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .whiteTwo
        self.collectionView.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
    }
    
    private func addInSubwues() {
        view.addSubview(nextButton)
        view.addSubview(pageControll)
    }
    
    private func setupLayout() {
        
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: pageControll.topAnchor, constant: -30).isActive = true
        
        pageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    @objc func nextButtonTapped() {
        let nextIndex = min(pageControll.currentPage + 1, Manager.shared.pages.count - 1)
        let indexPath  = IndexPath(item: nextIndex, section: 0)
        pageControll.currentPage = nextIndex
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        //MARK: - MAKE HERE Transition to next Controller
        if nextIndex == 3 {
            nextButton.setTitle("Next Controller", for: .normal)
            nextButton.addTarget(self, action: #selector(toLogonVC), for: .touchUpInside)
        } else {
            nextButton.setTitle("Continiue", for: .normal)
        }
    }

    @objc func toLogonVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let dvc = storyboard.instantiateViewController(identifier: "LoginVC") as? LoginVC else { return }
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Manager.shared.pages.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        let page = Manager.shared.pages[indexPath.row]
        cell.imageView.image = UIImage(named: page.imageName)
        cell.pageLabelText.text = page.pageText
        return cell
    }
}

extension PageSwipeController: UICollectionViewDelegateFlowLayout {
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControll.currentPage = Int( x / view.frame.width)
        pageControll.currentPage == 3 ? nextButton.setTitle("Next Controller", for: .normal) : nextButton.setTitle("Continiue", for: .normal)
    }
}
