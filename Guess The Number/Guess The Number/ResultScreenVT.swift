//
//  ResultScreenVT.swift
//  Guess The Number
//
//  Created by cemal tüysüz on 24.08.2021.
//

import UIKit

class ResultScreenVT: UIViewController {

    @IBOutlet weak var `case`: UILabel!
    @IBOutlet weak var caseImage: UIImageView!
    @IBOutlet weak var num: UILabel!
    var isSuccess:Bool?
    var rndNum:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image2 = UIImage(named: "Sad Face")

        if isSuccess != nil {
            if isSuccess! {
                `case`.text = "Win"
            }else{
                `case`.text = "Lose"
                caseImage.image = image2
            }
            num.text = "number is : \(rndNum!)"
        }else{
            `case`.text = "Something went wrong..."
        }
        
    }
    @IBAction func retryGame(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
