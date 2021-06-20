

import UIKit

class OnBoardingViewController: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var slides: [OnBoardingModel] = []
    
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Tap to start", for: .normal)
                imageView.image = slides[pageControl.currentPage].images
            }
            else{
                nextButton.setTitle("Next", for: .normal)
              
            }
        }
    }
    
    let state = UserState()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        setup()
        imageView.image = slides[pageControl.currentPage].images
        
        pageControl.addTarget(self, action: #selector(pageControlAction(_:)), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func pageControlAction(_ sender: Any) {
            // paste codingan buat set image
        imageView.image = slides[pageControl.currentPage].images
        
        currentPage = pageControl.currentPage
        
        if currentPage == slides.count - 1 {
            nextButton.setTitle("Tap to start", for: .normal)
            imageView.image = slides[pageControl.currentPage].images
        }
        else{
            nextButton.setTitle("Next", for: .normal)
          
        }
    }
    
    
    func setup(){
        nextButton.layer.cornerRadius = 8
        
        slides = [
            OnBoardingModel(images: UIImage(imageLiteralResourceName: "onboard1.0")),
            OnBoardingModel(images:  UIImage(imageLiteralResourceName: "onboard2.0"))
        ]
    
    }
    

    @IBAction func tappedNextButton(_ sender: UIButton) {
        if currentPage == slides.count - 1 {
     
            state.setIsNotNewUser()
            dismiss(animated: true, completion: nil)
        }
        else{
            currentPage += 1
            _ = IndexPath(item: currentPage, section: 0)
        }
    }

}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "onBoardingId", for: indexPath) as! OnBoardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        cell.imageView.frame = view.superview!.frame
        
        return cell
    }
    
    //set the size item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
  
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        //pageControl.currentPage = currentPage
    }
    
   
    
    
}


