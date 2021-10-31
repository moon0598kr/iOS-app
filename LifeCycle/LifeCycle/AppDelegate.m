//
//  AppDelegate.m
//  LifeCycle
//
//  Created by Ipageon_김태형 on 2021/10/31.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"어플이 실행되고 난 후");
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application{
    NSLog(@"어플이 포그라운드에서 백그라운드로 진입");
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    NSLog(@"어플이 백그라운드에서 포그라운드로 진입");
}
- (void)applicationWillTerminate:(UIApplication *)application{
    NSLog(@"어플이 종료 될 것임");
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
