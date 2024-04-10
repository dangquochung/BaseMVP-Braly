//
//  SplashVC.swift
//  InPulseDemo
//
//  Created by Hùng Đặng on 10/04/2024.
//

import UIKit

class SplashVC: UIViewController, PresenterToViewSplashProtocol {
    // MARK: - Properties
    private var presenter: ViewToPresenterSplashProtocol?
    
    func setPresenter(presenter: ViewToPresenterSplashProtocol) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
