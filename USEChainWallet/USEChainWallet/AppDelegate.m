//
//  AppDelegate.m
//  USEChainWallet
//
//  Created by Jacob on 2019/3/3.
//  Copyright © 2019 Jacob. All rights reserved.
//

#import "AppDelegate.h"
#import "USEChainWallet-Swift.h"
#import "UseEthersManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //USEWalletMainOldVC
    // self.window.rootViewController = [[USEWalletMainNewVC alloc]init];
    //         self.window.rootViewController = [[USEWalletMainOldVC alloc]init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[USEWalletMainOldVC alloc]init]];
    [self.window makeKeyAndVisible];
//    [UseChainNetSwift getCurrentBlockNumWithResource:^(id result, NSError * error) {
//        NSLog(@"%@", result);
//    }];
    
//        Account *account = [UseEthersManager getAccountWithMnemonicPhrase:@"romance tattoo describe peanut asset price outer round grass master carpet town"];
//
//        NSLog(@"%@", account.address);
//    [UseEthersManager account:account sendTransactionWithGaslimit:@"21000" GasPrice:@"1000000000" AndValue:@"0.0001" ToAddress:@"0xAD12Ed26b3d8F2E31d9BA864Ffa07D0d2d5EE5A0" finished:^(id result, NSError *error) {
//        NSLog(@"%@", result);
//    }];
    ////    NSLog(@"%@", account.mnemonicPhrase);
    ////    Account *secondAccount = [UseEthersManager createAccount];
    ////    NSLog(@"%@", secondAccount.address);
    ////    NSLog(@"%@", secondAccount.mnemonicPhrase);
    //    [account encryptSecretStorageJSON:@"1234" callback:^(NSString *json) {
    //        NSLog(@"%@", json);
    //    }];
    
    //    NSString *keystoreStr = @"{\"address\":\"99bd6e16f7e9418a0263d17274239422d9c27142\",\"id\":\"234abd95-e075-4902-9b6c-dd8d1733d2c3\",\"version\":3,\"crypto\":{\"cipher\":\"aes-128-ctr\",\"cipherparams\":{\"iv\":\"188955a8878b565e24aa15915e1af4aa\"},\"ciphertext\":\"43356913c31d955f34ec2caca8f4bc08d0e81a21104e98f27fec9a138ce67c2d\",\"kdf\":\"scrypt\",\"kdfparams\":{\"dklen\":32,\"n\":1024,\"p\":1,\"r\":8,\"salt\":\"e5e2a2fb95ae61fe64cb04e2e22b609fcb11a228f6004fd83d6dd5c891ee98f0\"},\"mac\":\"20bc15d3a8a41273cfb425223dd70703143486a787f410fa38faa0f06a26d0f1\"}}";
    //    [UseEthersManager decryptSecretStorageJSON:keystoreStr password:@"1234" callback:^(Account *account, NSError *NSError) {
    //        NSLog(@"%@", account.address);
    //    }];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
