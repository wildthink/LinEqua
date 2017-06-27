//
//  Matrix.swift
//  Pods
//
//  Created by Miroslav Milivojevic on 6/26/17.
//
//

import UIKit

public class Matrix: NSObject {
    
    public var size = Size(x: 0, y: 0)
    public var elements: [[Double]] = []
    
    // MARK: inits
    
    private override init() {}
    
    public convenience init(withSize size: Size) {
        self.init()
        self.size = size
        elements = [[Double]].init(repeating: [Double].init(repeating: 0.0, count: size.y), count: size.x)
    }
    
    public convenience init(withElements elements: [[Double]]) {
        self.init()
        if elements.count <= 0 {
            fatalError("Matrix with size [0][0] not allowed")
        }
        self.size = Size(x: elements.count, y: elements[0].count)
        self.elements = elements
    }
    
    // MARK: override vars
    
    override public var description: String {
        return elements.reduce("") { $0 + "\($1)\n" }
    }
    
    //MARK: functionalities
    
    public func transpose() -> Matrix {
        let transponed = Matrix(withSize: Size(x: size.y, y: size.x))
        for i in 0..<size.y {
            for j in 0..<size.x {
                transponed.elements[i][j] = self.elements[j][i]
            }
        }
        self.elements = transponed.elements
        return self
    }
    
}
