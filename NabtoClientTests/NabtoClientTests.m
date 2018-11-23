//
//  NabtoClientTests.m
//  NabtoClientTests
//
//  Created by Nabto on 2/16/17.
//  Copyright © 2017 Nabto. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NabtoClient.h"

@interface NabtoClientTests : XCTestCase

@end

@implementation NabtoClientTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObjcWrapper {
    XCTAssertEqual([[NabtoClient instance] nabtoStartup], NABTO_OK);
    XCTAssertEqual([[NabtoClient instance] nabtoOpenSessionGuest], NABTO_OK);
    char* result;
    size_t len;
    char* mimeType;
    nabto_status_t status;
    status = [[NabtoClient instance] nabtoFetchUrl:@"nabto://demo.nabto.net/wind_speed.json?" withResultBuffer:&result resultLength:&len mimeType:&mimeType];
    if (status == NABTO_OK) {
        NSData *data = [NSData dataWithBytes:result length:len];
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"fetchUrl finished with result: %@", str);
        XCTAssertTrue([str containsString:@"speed_m_s"]);
        nabtoFree(result);
        nabtoFree(mimeType);
    } else {
        NSLog(@"fetchUrl finished with status %d", status);
    }
    XCTAssertEqual(status, NABTO_OK);
}

- (void)testObjcWrapperRpc {
    XCTAssertEqual([[NabtoClient instance] nabtoStartup], NABTO_OK);
    XCTAssertEqual([[NabtoClient instance] nabtoOpenSessionGuest], NABTO_OK);
    char* json;
    nabto_status_t status;
    NSString* interfaceXml = @"<unabto_queries><query name='wind_speed.json' id='2'><request></request><response format='json'><parameter name='rpc_speed_m_s' type='uint32'/></response></query></unabto_queries>";
    char* errorMsg;
    if ([[NabtoClient instance] nabtoRpcSetDefaultInterface:interfaceXml withErrorMessage:&errorMsg] != NABTO_OK) { XCTAssertTrue(false);
    };
    status = [[NabtoClient instance] nabtoRpcInvoke:@"nabto://demo.nabto.net/wind_speed.json?" withResultBuffer:&json];
    if (status == NABTO_OK) {
        NSLog(@"rpcInvoke finished with result: %s", json);
        NSString *str = [NSString stringWithUTF8String:json];
        XCTAssertTrue([str containsString:@"rpc_speed_m_s"]);
        nabtoFree(json);
    }
    XCTAssertEqual(status, NABTO_OK);
}

- (void)testObjCWrapperFromDocs {
    if ([[NabtoClient instance] nabtoStartup] != NABTO_OK) {
        // handle error
    }
    if ([[NabtoClient instance] nabtoOpenSessionGuest] != NABTO_OK) {
        // handle error
    }
    
    NSString* interfaceXml = @"<unabto_queries><query name='wind_speed.json' id='2'><request></request><response format='json'><parameter name='rpc_speed_m_s' type='uint32'/></response></query></unabto_queries>";
    
    char* errorMsg;
    if ([[NabtoClient instance] nabtoRpcSetDefaultInterface:interfaceXml withErrorMessage:&errorMsg] != NABTO_OK) {
        // handle error
    }
    
    char* json;
    nabto_status_t status = [[NabtoClient instance] nabtoRpcInvoke:@"nabto://demo.nabto.net/wind_speed.json?" withResultBuffer:&json];
    if (status == NABTO_OK) {
        NSLog(@"rpcInvoke from docs finished with result: %s", json);
        nabtoFree(json);
    }
    
    [[NabtoClient instance] nabtoShutdown];
}

- (void)testNativeSdk {
    XCTAssertEqual(nabtoStartup(NULL), NABTO_OK);
    nabto_handle_t session;
    XCTAssertEqual(nabtoOpenSession(&session, "guest", "123456"), NABTO_OK);
    char* result;
    size_t len;
    char* mimeType;
    nabto_status_t status;
    status = nabtoFetchUrl(session, "nabto://demo.nabto.net/wind_speed.json?", &result, &len, &mimeType);
    if (status == NABTO_OK) {
        NSData *data = [NSData dataWithBytes:result length:len];
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"fetchUrl finished with result: %@", str);
        XCTAssertTrue([str containsString:@"speed_m_s"]);
        nabtoFree(result);
        nabtoFree(mimeType);
    } else {
        NSLog(@"fetchUrl finished with status %d", status);
    }
    XCTAssertEqual(status, NABTO_OK);
}

@end
