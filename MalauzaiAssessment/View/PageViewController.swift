//
//  PageViewController.swift
//  MalauzaiAssessment
//
//  Copyright © 2019 Oj Shrivastava. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    //ViewModel that gives data to this view controller
    var viewModel = PagesViewModel()
    
    /**
     Lifecycle method that will be called on loading the view.
     Set the data source for the page view.
     Fetch the data from the Flickr server and load the page view controller
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        fetchData()
    }
    
    /**
     Fetches the data from server.
     If data is retrieved successfully, populate the view model and reload the content
     Else show the error alert
     */
    private func fetchData() {
        FlickrServiceManager.manager.getFlickrFeed(from: Constants.flickrURL.rawValue) { flickrResult in
            
            switch flickrResult {
            case .success(let receivedResult):
                self.viewModel.setPhotos(photos: receivedResult.items)
                
                DispatchQueue.main.async {
                    let vc = self.createDisplayController(at: 0)!
                    self.setViewControllers([vc],
                                            direction: .forward,
                                            animated: true,
                                            completion: nil)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlertWith(title: "Warning",
                                       message: error.localizedDescription)
                }
            }
        }
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    /**
     Creates a new display controller and populte with necessary data
     If there's no Photos available or if the index is more than the photos count, then return nil
     Else instantiate a new view controller and popuate the view model
     @param at: Index ot the photo which it has to display
     */
    private func createDisplayController(at index: Int) -> DisplayViewController? {
        if viewModel.photosCount == 0 || index >= viewModel.photosCount {
            return nil
        }
        
        guard let storyboard = storyboard else {
            return nil
        }
        
        
        if let displayVC = storyboard.instantiateViewController(withIdentifier: "DisplayViewController") as? DisplayViewController,
            let item = viewModel.getPhoto(at: index) {
            
            displayVC.displayModel = DisplayViewModel(index: index,
                                                      title: item.title,
                                                      image: item.media?.m)
            
            return displayVC
        }
        
        return nil
    }
    
    /**
     Datasource method of the page view controller that will be called to display the previous view.
     Here we'll check if the index is 0 or not part of the pages, then create the view controller and return accordingly
     */
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? DisplayViewController else {
            return nil
        }
        
        var index = vc.pageIndex
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index -= 1
        return createDisplayController(at: index)
    }
    
    /**
    Datasource method of the page view controller that will be called to display the later view.
    Here we'll check if the index within the photos count available, then create the view controller and return accordingly
    */
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vc = viewController as? DisplayViewController else {
            return nil
        }
        
        var index = vc.pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == viewModel.photosCount {
            return nil
        }
     
        return createDisplayController(at: index)
    }
}
