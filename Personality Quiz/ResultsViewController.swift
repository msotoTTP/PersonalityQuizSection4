//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Mathew Soto on 5/18/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
    }
    
    func calculatePersonalityResult() {
        let answerFrequencies = responses.reduce(into: [:]) { frequencies, animal in
            frequencies[animal.type, default: 0] += 1
        }
        
        let result = answerFrequencies.sorted { $0.value > $1.value }.first!.key
        
        answerLabel.text = "You are a \(result.rawValue)!"
        definitionLabel.text = result.definition
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
