//
//  MainViewController.swift
//  ADK_BasicExample
//
//  Created by Scott Carter on 1/8/18.
//

import UIKit



class MainViewController: UIViewController {
    
    
    // ==========================================================================
    // Properties
    // ==========================================================================
    //
    // MARK: - Properties - Outlets
    //
    
    @IBOutlet weak var stringLabel: UILabel!
    
    @IBOutlet weak var doubleLabel: UILabel!
    
    @IBOutlet weak var intLabel: UILabel!
    
    @IBOutlet weak var boolSwitch: UISwitch!
    

    
    // MARK: - Instance Properties - Stored
    //
    
    
    // Backing store for the computed variables
    // mystring, mydouble, myint, mybool, backgroundColor
    //
    // Must use internal protection level (default) since the extension that needs access
    // to these variables does not reside in the same source file (extension in AppDeveloperKit.swift)
    
    
    var _mystring: String = ""
    var _mydouble: Double = 0.0
    var _myint: Int = 0
    var _mybool: Bool = false
    var _backgroundColor: UIColor = .white
    
    
    
    
    // MARK: - Instance Properties - Computed
    //
    
    // Provide AppDeveloperKit configuration support for
    // mystring, mydouble, myint, mybool, backgroundColor
    //
    // As with backing store, must use internal protection level (default)
    //
    // Note that the computed variables provide dynamic updates to UI
    // in the set {}.   The set {} is called from AppDeveloperKit when live updates
    // are received from Mac app.
    //
    
    var mystring: String {
        get {
            return _mystring
        }
        set {
            _mystring = newValue
            stringLabel.text = _mystring
        }
    }
    
    
    
    var mydouble: Double {
        get {
            return _mydouble
        }
        set {
            _mydouble = newValue
            doubleLabel.text =  String(describing: _mydouble)
        }
    }
    
    var myint: Int {
        get {
            return _myint
        }
        set {
            _myint = newValue
            intLabel.text =  String(describing: _myint)
        }
    }
    
    
    var mybool: Bool {
        get {
            return _mybool
        }
        set {
            _mybool = newValue
            boolSwitch.isOn = _mybool
        }
    }
    
    
    var backgroundColor: UIColor {
        get {
            return _backgroundColor
        }
        set {
            _backgroundColor = newValue
            view.backgroundColor =  _backgroundColor
        }
    }
    
    
    
 
    
    
    
    // ==========================================================================
    // Initializations
    // ==========================================================================
    //
    // MARK: - Initializations
    
    deinit {
        
        // We should always cleanup by destroying the AppDeveloperKit configuration for this
        // class instance when we deinit.
        adk_deinitMainViewController()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup AppDeveloperKit configuration.
        adk_initMainViewController()
        
        // AppDeveloperKit provides initialization of backing store.  Use computed
        // variables to initialize our app.
        stringLabel.text = mystring
        doubleLabel.text =  String(describing: mydouble)
        intLabel.text =  String(describing: myint)
        boolSwitch.isOn = mybool
        self.view.backgroundColor = backgroundColor
    }
    
    
}








