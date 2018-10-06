//
//  FS_Bonjour.h
//  FastStart
//
//  Created by Scott Carter on 6/22/17.
//  Copyright © 2017 Scott Carter. All rights reserved.
//

#import <Foundation/Foundation.h>




#pragma mark -

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//                    Forward Declarations
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//

#pragma mark Forward Declarations

// None


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//                    Protocols
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
#pragma mark -
#pragma mark Protocols

@protocol FS_BonjourDelegate <NSObject>

- (void)connectionEstablished;

- (void)receivedObject:(id)object;

// Call delegate to report information.
//
// msg: User visible message.
// debugMsg: Only shown in Debug configuration (not to users who only get Release builds).
- (void)reportInfo:(NSString *)msg
          debugMsg:(NSString *)debugMsg
          filePath:(NSString *)filePath
          function:(const char *)function
              line:(NSInteger)line;

@end


// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//                    Public Interface
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
#pragma mark -
@interface FS_Bonjour : NSObject



// ==========================================================================
// Properties
// ==========================================================================
//
#pragma mark -
#pragma mark  Properties

@property(weak, nonatomic) id<FS_BonjourDelegate> delegate;


// ==========================================================================
// Class method declarations
// ==========================================================================
//
#pragma mark -
#pragma mark Class method declarations

// None


// ==========================================================================
// Instance method declarations
// ==========================================================================
//
#pragma mark -
#pragma mark Instance method declarations

- (id)initBonjourWithDelegate:(id<FS_BonjourDelegate>)delegate
   connectionNotificationName:(NSString *)connectionNotificationName
            expectedServiceId:(NSString *)expectedServiceId;

- (void)sendDictToServer:(NSDictionary *)dict;

@end





