//
//  ViewController.swift
//  Closures
//
//  Created by Piyush Sharma on 18/09/18.
//  Copyright © 2018 Piyush Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1 Function
        let sumFunction = funcExample(data1: 2, data2: 4)
        print(sumFunction)
        
        //2 Closure
        closureExample()
        
        //3 Closure without parameter and return type
        closureWithoutParamereAndReturnType()
        
        //4 Closure without parameter and string return type
        closureWithJustReturnType()
        
        //5 Closure with just parameter
        closureWithJustParameter()
        
        //6 Closures as parameter for func
        functionWithClosureAsItsParameter()
        
        //Trailing Closure
        //********* If a function accepts a closure as its last parameter, the closure can be passed similar to a function body between { }. This type of closure written outside of function call parentheses is known as trailing closure.
        trailingClosure()
        
        //7 AutoClosure
        
    }
    
    func trailingClosure()
    {
        var addNameClosure: (String) -> String = { $0 + " ANONYMOUS\n"}
        
        func greetPeople(greetings: [String], closure: (String) -> String) -> String {
            var greeting = ""
            for aGreeting in greetings {
                greeting += closure(aGreeting)
            }
            return greeting
        }
        
        print(greetPeople(greetings: [" Hallo", "Hello", " Bonjour"], closure: addNameClosure))
        
        print(greetPeople(greetings: [" Hallo", "Hello", " Bonjour"]) { name in return name + " Piyush\n"})
    }

    func functionWithClosureAsItsParameter()
    {
        func someSimpleFunction(someClosure:()->()) {
            
            print("Function Called")
        }

        someSimpleFunction(someClosure: {
            print("Hello World! from closure")
        })
    }
    
    func funcExample(data1 : Int, data2 : Int) -> Int
    {
        return data1 + data2
    }
    
    func closureExample()
    {
        let sumClosure = {(data1 :Int, data2 : Int) -> Int in
            return data2 + data1
        }
        let closureResult = sumClosure(5, 5)
        print(closureResult)
    }
    
    func closureWithoutParamereAndReturnType()
    {
        let closureWihoutPR1 : () -> () = {() in print("Printing closure without parameters1")
        }
        print(closureWihoutPR1())
        //or
        let closureWihoutPR2 = {("Printing closure without parameters2")
        }
        print(closureWihoutPR2())
    }
    
    func closureWithJustReturnType()
    {
        //1
        let closureWithoutParameter1 : () -> String = {() in return "Closure with just return"
        }
        print(closureWithoutParameter1())
    }
    
    func closureWithJustParameter()
    {
        //1
        let closureWithParameter1 : (String) -> Void = {stringParm in print("Hello \(stringParm)")
        }
        print(closureWithParameter1("Piyush"))
        
        //2
        let closureWithParameter2 : (String) -> (String) = {
            return "Hello \($0)"
        }
        print(closureWithParameter2("Piyush Sharma"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

