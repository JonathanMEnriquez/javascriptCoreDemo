//
//  BasicsViewController.swift
//  JSCore
//
//  Created by Gabriel Theodoropoulos on 13/02/17.
//  Copyright © 2017 Appcoda. All rights reserved.
//

import UIKit
import JavaScriptCore

class BasicsViewController: UIViewController {
    
    var jsContext: JSContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewDidAppear(_ animated: Bool) {
        initializeJS()
        helloWorld()
        firstAndLast()
        mathTime()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeJS(){
        self.jsContext = JSContext()
        
        self.jsContext.exceptionHandler = { context, exception in
            if let exc = exception {
                print("JS Exception:", exc.toString())
            }
        }
        
        if let jsSourcePath = Bundle.main.path(forResource: "jssource", ofType: "js") {
            do {
                let jsSourceContents = try String(contentsOfFile: jsSourcePath)
                self.jsContext.evaluateScript(jsSourceContents)
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func helloWorld() {
        if let varHelloWorld = self.jsContext.objectForKeyedSubscript("helloWorld") {
            print(varHelloWorld.toString())
        }
    }
    
    func firstAndLast() {
        let firstname = "Jonathan"
        let lastname = "Enriquez"
        
        if let functionFullName = self.jsContext.objectForKeyedSubscript("getFullName") {
            if let fullName = functionFullName.call(withArguments: [firstname, lastname]) {
                print(fullName.toString())
            }
        }
    }
    
    func mathTime() {
        let values = [10, -5, 22, 14, -35, 101, -55, 16, 14]
        
        if let functionMaxMinAverage = jsContext.objectForKeyedSubscript("maxMinAverage") {
            if let results = functionMaxMinAverage.call(withArguments: [values]) {
                if let resultsDict = results.toDictionary() {
                    for (k, v) in resultsDict {
                        print(k, v)
                    }
                }
            }
        }
    }
    
    // MARK: IBAction Method
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
