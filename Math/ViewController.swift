//
//  ViewController.swift
//  Math
//
//  Created by Алексей on 25/08/2017.
//  Copyright © 2017 Алексей. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {

    var currentScore = 0;
    var returnValue : Bool = false;
    var currentStreak = 0;
    var gtnreturn = 0;
    var rightAns=0;
    var isPrevTrue = false;
    var fNumber = arc4random_uniform(100-10+1) + 10;
    var sNumber = arc4random_uniform(100-10+1) + 10;
    var enteredAnswer : String = " " ;
    var counter = 0;
    var numbers : [Int] = [0,0];
    
//    var timer = Timer()

//    var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(timerAction), userInfo: nil, repeats: true)
    
    
    
    // selector should be like this : #selector(self.handleTap(recognizer:))
    
    @IBOutlet weak var TaskText: UILabel!
    @IBOutlet weak var currentScoreTextField: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var currentStreakTextField: UILabel!
    
    
    @IBAction func CheckButton(_ sender: Any) {
        enteredAnswer = textField.text!;
        checkAns(answer: enteredAnswer);
//        getNewTask(answer: enteredAnswer);

        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        currentScore  = 0;
        currentStreak = 0;
        currentScoreTextField.text = String(currentScore);
        currentStreakTextField.text = String(currentStreak);
        Button.backgroundColor = UIColor.white;

    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNewTask();
        // Do any additional setup after loading the view, typically from a nib.
    
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true);
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    
    
    
    
    func checkAns( answer: String) {

        // check if entered number is true
        if Int(answer) == Int(rightAns){
            currentStreak += 1;
            returnValue = true;
            Button.backgroundColor = UIColor.green;
            
        }
        else {
            
            returnValue = false;
            currentStreak = 0;
            Button.backgroundColor = UIColor.red;
            
        }
        
        if returnValue == true {
            currentScore += 1;
            currentScoreTextField.text = String(currentScore);
        }
        
        currentStreakTextField.text = String(currentStreak);

        
      
        getNewTask();
        
    }

    
    func getNewTask(){
        
        textField.text = "";
        
        
        fNumber = arc4random_uniform(endNumber - startNumber + 1) + startNumber;
        
        sNumber = arc4random_uniform(endNumber - startNumber + 1) + startNumber;
        
        numbers[0] = Int(fNumber);
        numbers[1] = Int(sNumber);
        
        if actionSelectedNum == 0 {
            
            TaskText.text = String(numbers[0]) + " + " +  String(numbers[1]);
             rightAns = numbers[0] + numbers[1];

        }
        if actionSelectedNum == 1 {
            TaskText.text = String(numbers[0]) + " - " +  String(numbers[1]);
             rightAns = numbers[0] - numbers[1];
            
        }
        if actionSelectedNum == 2 {
            TaskText.text = String(numbers[0]) + " * " +  String(numbers[1]);
             rightAns = numbers[0] * numbers[1];
        }
        
     
  
    }
    
    
    
    
    
}
