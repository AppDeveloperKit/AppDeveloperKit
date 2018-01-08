
// ====================================================
//
//              DO NOT EDIT.  Auto Generated.
//
// =====================================================
//

import AppDeveloperKit

extension MainViewController {

   func adk_deinitMainViewController() {

       let adk = ADK_Config.shared()

       adk.deregisterClass(sender: self)
   }

   func adk_initMainViewController() {

       let adk = ADK_Config.shared()

       weak var weakSelf: MainViewController? = self

       adk.registerClass(sender: self, name: "MainViewController")


       adk.configString(sender: self, name: "mystring", initComplete: { (data) in
           if data != nil {
               weakSelf?._mystring = data!
           }
       }, changeComplete: { (data) in
           if data != nil {
               weakSelf?.mystring = data!
           }
       })


       adk.configDouble(sender: self, name: "mydouble", initComplete: { (data) in
           if data != nil {
               weakSelf?._mydouble = data!
           }
       }, changeComplete: { (data) in
           if data != nil {
               weakSelf?.mydouble = data!
           }
       })


       adk.configInt(sender: self, name: "myint", initComplete: { (data) in
           if data != nil {
               weakSelf?._myint = data!
           }
       }, changeComplete: { (data) in
           if data != nil {
               weakSelf?.myint = data!
           }
       })


       adk.configBool(sender: self, name: "mybool", initComplete: { (data) in
           if data != nil {
               weakSelf?._mybool = data!
           }
       }, changeComplete: { (data) in
           if data != nil {
               weakSelf?.mybool = data!
           }
       })


       adk.configColor(sender: self, name: "backgroundColor", initComplete: { (data) in
           if data != nil {
               weakSelf?._backgroundColor = data!
           }
       }, changeComplete: { (data) in
           if data != nil {
               weakSelf?.backgroundColor = data!
           }
       })


   }
}


