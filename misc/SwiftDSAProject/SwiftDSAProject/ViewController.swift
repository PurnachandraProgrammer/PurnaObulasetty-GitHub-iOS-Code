//
//  ViewController.swift
//  SwiftDSAProject
//
//  Created by Purnachandra on 09/08/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listElements = [12,1,3,10,7,7,8,4,2,9,6]
//        let listElements = [12,10,8,4,2,6]
//        let listElements = [1,1,9,3,5,9]
        
        let result = performCodeExercise(listElements: listElements)

        if result != nil {
            print(result!.description)
        }
        else {
            print("Result is empty")
        }
        
        let array = [4, 5, 7, 2, 2, 1]
        let target = 8
        let resultsArray = performSecondCodeExercise(array: array, target: target)
        
        for element in resultsArray {
            print(element)
        }
    }

    func performCodeExercise(listElements:[Int]) -> Node<Int>? {
        

        var listHead:Node<Int>? = nil
        var listLast:Node<Int>? = nil

        var traverseHead:Node<Int>? = nil

        for element in listElements {
            
            let node = Node(value: element)
            
            if listHead != nil {
                listLast?.next = node
                node.next = nil
                listLast = node
            }
            
            else {
                listHead = node
                listLast = listHead
                listHead?.next = listLast
            }
        }
        
        traverseHead = listHead
        
        sortLinkedInList()
        // sorting the array into even elements and odd elements

        func sortLinkedInList() {
            
            var evenHead:Node<Int>? = nil
            var evenHeadLast:Node<Int>? = nil
            
            var oddHead:Node<Int>? = nil
            var oddHeadLast:Node<Int>? = nil
            
            var traverseHead:Node? = listHead

            // head
            while traverseHead != nil {
                
                let element = traverseHead!.value
                let elementNode = Node(value: element)
             
                // It is even
                if element%2 == 0 {
                    
                    if evenHead == nil {
                        evenHead = elementNode
                        evenHeadLast = evenHead
                    }
                    else {
                        evenHeadLast?.next = elementNode
                        evenHeadLast = elementNode

                    }
                    evenHeadLast?.next = nil
                }
                    
                // It is odd
                else {
                    
                    if oddHead == nil {
                        oddHead = elementNode
                        oddHeadLast = oddHead
                    }
                    else {
                        oddHeadLast?.next = elementNode
                        oddHeadLast = elementNode
                    }
                    oddHeadLast?.next = nil
                }
                
                traverseHead = traverseHead?.next
            }
            
            
            traverseHead = (evenHead != nil) ? evenHead : oddHead
            evenHeadLast?.next = oddHead
            oddHeadLast?.next = nil
            traverseHead = evenHead
       }
        
        return traverseHead
    }
    
    func performSecondCodeExercise(array:[Int], target:Int) -> [[Int]] {
        var sum = 0
        var finalArray:[Int] = []
        var combinationArray:[[Int]] = []

        for firstIndex in 0..<array.count-1 {

            let element = array[firstIndex]
            sum = element

            finalArray = []
            finalArray.append(element)
            
            for secondIndex in firstIndex+1..<array.count {
                
                let nextElement = array[secondIndex]
                sum = sum + nextElement
                
                // 5
                if sum == target {
                    
                    finalArray.append(nextElement)
                    combinationArray.append(finalArray)
                    finalArray = []
                    break
                }
                
                else if sum < target {
                    finalArray.append(nextElement)
                }
                else {
                    sum = array[firstIndex]
                    finalArray = []
                    finalArray.append(array[firstIndex])
                }
                
            }
            
        }

        return combinationArray
    }

}

