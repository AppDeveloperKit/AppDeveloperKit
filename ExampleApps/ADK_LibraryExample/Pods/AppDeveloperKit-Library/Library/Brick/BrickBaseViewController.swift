//
//  BrickBaseViewController.swift
//  AppDeveloperKit-Library
//
//  Created by Scott Carter on 11/20/17.

import UIKit

import AppDeveloperKit
import BrickKit


// An example VC that uses the BrickKit code at https://github.com/wayfair/brickkit-ios
//
// Intended to demonstrate a more sophisticated integration with AppDeveloperKit.
// - JSON to configure layout.
// - Setup as a Library component that can be subclassed.
//

open class BrickBaseViewController: BrickViewController {
    
    
    // ==========================================================================
    // Properties
    // ==========================================================================
    //
    // MARK: - Properties - Outlets
    //
    
    
    // MARK: - Instance Properties - Stored
    //
    
    
    // The stored property json is used to for general configuration of the bricks.
    //
    // Setup a placeholder for json that can be overriden from value in AppDeveloperKit.plist
    open var _json: String = """
{
    "labels": [
        {
            "brickText": "Placeholder",
            "backgroundColor": "rgba(255, 255, 0, 0.5)",
            "repeatCount": 1,
            "brickSize": {
                "width": "ratio",
                "widthValue": 1.0,
                "height": "ratio",
                "heightValue": 1.0
            }
        }
        
    ]
}
"""
    
    open var json: String {
        get {
            return _json
        }
        set {
            _json = newValue
            
            // Reload our bricks when json changes.
            setupBricks()
        }
    }
    
    
    // The stored property horizontal is used to configure the direction of scrolling of bricks.
    //
    // Setup a placeholder for horizontal that can be overriden from value in AppDeveloperKit.plist
    open var _horizontal: Bool = false
    
    open var horizontal: Bool {
        get {
            return _horizontal
        }
        set {
            _horizontal = newValue
            
            // Reload our bricks when scrolling orientation changes.
            setupBricks()
        }
    }
    
    
    
    // MARK: - Instance Properties - Computed
    //
    
    
    
    // MARK: - Type Properties - Stored
    //
    // Use "static" or "class" prefix
    //
    
    
    
    
    // MARK: - Type Properties - Computed
    //
    // Use "static" or "class" prefix
    
    
    
    
    // ==========================================================================
    // Structs
    // ==========================================================================
    //
    // MARK: - Structs
    
    
    // The following structs (Section, Label and BSize) are used when parsing the json
    // that is read from AppDeveloperKit.plist (upon launch) or via live updates from the
    // Mac AppDeveloperKit app.
    
    // A brick section for JSON parsing.
    struct Section: Codable {
        let labels: [Label]
        
        func labelBricks() -> [LabelBrick] {
            var labelBricks: [LabelBrick] = []
            
            for label in labels {
                let labelBrick = label.labelBrick()
                
                labelBricks.append(labelBrick)
            }
            
            return labelBricks
        }
    }
    
    // A brick label for JSON parsing.
    struct Label: Codable {
        let brickSize: BSize?
        let brickText: String  // JSON must provide the text as a minimum, not optional.
        let backgroundColor: String?
        let repeatCount: Int?
        
        func labelBrick() -> LabelBrick {
            
            
            // Use a default size using ratio = 0.5 for width and height, unless size provided.
            var size = BrickSize(width: .ratio(ratio: 0.5), height: .ratio(ratio: 0.5))
            
            if let brickSize = brickSize {
                size = brickSize.brickSize()
            }
            
            // Create our LabelBrick.
            let labelBrick = LabelBrick(size: size, text: brickText)
            
            
            // Use the background color provided, else set to default of .cyan
            if let backgroundColor = backgroundColor {
                let bgColor = UIColor.init(adk_rgb: backgroundColor)
                
                // If we are able to correctly parse a background color, then use it.
                if let bgColor = bgColor {
                    labelBrick.backgroundColor = bgColor
                }
            }
                
            else {
                labelBrick.backgroundColor = .cyan
            }
            
            // Use the repeat count provided, else set default to 8
            if let repeatCount = repeatCount {
                labelBrick.repeatCount = repeatCount
            }
            else {
                labelBrick.repeatCount = 8
            }
            
            
            return labelBrick
        }
        
    }
    
    // A brick size for JSON parsing.
    struct BSize: Codable {
        let width: BDimension
        let widthValue: CGFloat?
        
        let height: BDimension
        let heightValue: CGFloat?
        
        func brickSize() -> BrickSize {
            let w = brickDimension(dimension: width, value: widthValue)
            let h = brickDimension(dimension: height, value: heightValue)
            let brickSize = BrickSize(width: w, height: h)
            
            return brickSize
        }
        
        func brickDimension(dimension: BDimension, value: CGFloat?) -> BrickDimension {
            
            var brickDimension: BrickDimension
            
            switch dimension {
            case .ratio:
                brickDimension = BrickDimension.ratio(ratio: value!)
                break
                
            case .fixed:
                brickDimension = BrickDimension.fixed(size: value!)
                break
                
            case .fill:
                brickDimension = BrickDimension.fill
                break
            }
            
            return brickDimension
        }
        
    }
    
    
    // ==========================================================================
    // Enumerationss
    // ==========================================================================
    //
    // MARK: - Enumerations
    
    
    // A brick dimension for JSON parsing.
    enum BDimension: String, Codable {
        case ratio
        case fixed
        case fill
    }
    
    
    // ==========================================================================
    // Actions
    // ==========================================================================
    //
    // MARK: - Actions
    
    
    // None
    
    
    
    // ==========================================================================
    // Initializations
    // ==========================================================================
    //
    // MARK: - Initializations
    
    deinit {
        // We should always cleanup by destroying the AppDeveloperKit configuration for this
        // class instance when we deinit.
        adk_deinit()
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup AppDeveloperKit configuration.
        adk_init()
        
        self.view.backgroundColor = .white
    }
    
    
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Load our bricks.
        setupBricks()
    }
    
    
    
    // ==========================================================================
    // Type methods
    // ==========================================================================
    //
    
    // Declarations from extensions cannot be overridden yet
    
    
    // Since this is a Library component, provide methods that can be overriden from a subclass.
    //
    // The function names adk_deinit and adk_init should be considered to be a standard.
    //
    open func adk_deinit() {
        adk_deinitBrickBaseViewController()
    }
    
    open func adk_init() {
        adk_initBrickBaseViewController()
    }
    
    
    
    
    // ==========================================================================
    // Type methods
    // ==========================================================================
    //
    // Use static or class prefix
    //
    // Note: We include Type methods in main class, since class methods in extensions cannot be overriden currently.
    //
    // MARK: - Type methods
    
    
    // None
    
    
}



// MARK: -

private extension BrickBaseViewController {
    
    
    // ==========================================================================
    // Private Instance methods
    // ==========================================================================
    //
    // MARK: Private Instance methods
    
    
    // This is where we setup our bricks.  This function can be called from viewWillAppear or
    // when a computed property (controlled by ADK) changes due to a live update from Mac app.
    //
    func setupBricks() {
        
        // Parse the JSON that we get either from AppDeveloperKit.plist or over the wire from AppDeveloperKit Mac app.
        let jsonData = json.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        var section: Section
        
        do {
            section = try decoder.decode(Section.self, from: jsonData)
        }
        catch {
            print("error: \(error)")
            return
        }
        
        
        
        // Get our array of LabelBrick from what we parsed.
        let labelBricks = section.labelBricks()
        
        
        // Define the brick section.
        let brickSection = BrickSection(bricks: labelBricks,
                                        inset: 10, edgeInsets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        
        self.setSection(brickSection)
        
        
        //        let snapToBehavior = SnapToPointLayoutBehavior(scrollDirection: .horizontal(.center))
        //        self.brickCollectionView.layout.behaviors.insert(snapToBehavior)
        
        self.brickCollectionView.layout.behaviors.insert(CoverFlowLayoutBehavior(minimumScaleFactor: 0.75))
        
        
        if horizontal == true {
            layout.scrollDirection = .horizontal
        }
        else {
            layout.scrollDirection = .vertical
        }
        
        brickCollectionView.reloadData()
        
    }
    
    
    
}













