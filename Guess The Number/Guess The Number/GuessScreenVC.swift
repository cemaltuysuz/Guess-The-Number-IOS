//
//  GuessScreenVC.swift
//  Guess The Number
//
//  Created by cemal tüysüz on 24.08.2021.
//

import UIKit

class GuessScreenVC: UIViewController {

    @IBOutlet weak var remainingTrial: UILabel!
    @IBOutlet weak var router: UILabel!
    @IBOutlet weak var inputNum: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    var randomNum:Int?
    var count:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()

        randomNum  = Int.random(in: 0...100) // random generate
        print("Random number is : \(randomNum!)")
    }
    @IBAction func enterButton(_ sender: Any) {
        if let incomingNum = inputNum.text{
            if !incomingNum.isEmpty {
                if let convertNum = Int(incomingNum){
                    count-=1
                    if randomNum == convertNum {
                        performSegue(withIdentifier: "guessToResult", sender: true)
                    }else if convertNum>randomNum!{
                        router.text = "decrease"
                    }
                    else if convertNum<randomNum!{
                        router.text = "increase"
                    }
                    router.isHidden = false
                    if count == 0 {
                        performSegue(withIdentifier: "guessToResult", sender: false)
                    }
                    remainingTrial.text = "Remaining trial : \(count)"
                }else{
                    errorShow(status: false,message: "Please, enter numeric type value.")
                }
            }
            else{
                errorShow(status: false, message: "can not enter empty value.")
            }
        }
    }
    
    func errorShow(status:Bool,message:String){
        errorLabel.isHidden = status
        errorLabel.text = message
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let incomingData = sender as? Bool{
            let targetVC = segue.destination as! ResultScreenVT
            targetVC.isSuccess = incomingData
            targetVC.rndNum = randomNum!
        }
    }
}
