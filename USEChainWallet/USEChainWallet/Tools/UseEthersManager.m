//
//  UseEthersManager.m
//  UseChain
//
//  Created by Jacob on 2019/2/28.
//  Copyright © 2019 Jacob. All rights reserved.
//

#import "UseEthersManager.h"
#import "USEChainWallet-Swift.h"

@interface UseEthersManager()
@property (nonatomic, copy)NSString *json;
@end

@implementation UseEthersManager
+(Account *)createAccount {
    return  [Account randomMnemonicAccount];
}
+(Account *)getAccountWithMnemonicPhrase:(NSString *)MnemonicPhrase {
    return [Account accountWithMnemonicPhrase:MnemonicPhrase];
}
+(Account *)getAccountWithPrivateKey:(NSData *)privateKey {
    return [Account accountWithPrivateKey:privateKey];
}
+(void)getAccountWithJsonKey:(NSString *)jsonKey andPassword:(NSString *)password finished:(void (^)(Account *, NSError *))finished {
    [Account decryptSecretStorageJSON:jsonKey password:password callback:^(Account *account, NSError *NSError) {
        finished(account, nil);
    }];
}
+(void)encryptAccount:(Account *)account WithPassword:(NSString *)password finished:(void (^)(id, NSError *))finished {
    [account encryptSecretStorageJSON:password callback:^(NSString *json) {
        finished(json, nil);
    }];
}
+(void)account:(Account *)account sendTransactionWithGaslimit:(NSString *)gaslimit GasPrice:(NSString *)gasPrice AndValue:(NSString *)value ToAddress:(NSString *)address finished:(void (^)(id result, NSError *error))finished {
    NSString *toAddress = address;
    InfuraProvider *provider = [[InfuraProvider alloc] initWithTestnet:NO accessToken:@"uSjnFOfWwzf9edKibZ0V"];
    Transaction *transaction = [[Transaction alloc] init];
    //nonce处理一下
    NSString *fromAddress = [NSString stringWithFormat:@"%@", account.address];
    
    [UseChainNetSwift getNonceWithAddress:fromAddress resource:^(id result, NSError * error) {
        NSNumber *nonce = [self numberHexString:result];
        int intNonce = [nonce intValue];
        transaction.nonce = intNonce;
        transaction.gasLimit = [BigNumber bigNumberWithDecimalString:gaslimit];
        transaction.gasPrice = [BigNumber bigNumberWithDecimalString:gasPrice];
        transaction.toAddress = [Address addressWithString:toAddress];
        transaction.value = [Payment parseEther:value];
        [account sign:transaction];
        NSData *signedTransaction = [transaction serialize];
        [[provider sendTransaction:signedTransaction] onCompletion:^(HashPromise *promise) {
            if (promise.error) {
                finished(nil, promise.error);
            } else {
                finished(promise.result, nil);
            }
        }];
    }];
}

+(void)             account:(Account *)account
            sendCopycatCoin:(NSString *)coinType
    TransactionWithGaslimit:(NSString *)gaslimit
                   GasPrice:(NSString *)gasPrice
                   AndValue:(NSString *)value
                  ToAddress:(NSString *)address
                   finished:(void (^)(id result, NSError *error))finished {
    
    NSDictionary *ERC20Dict = [[NSUserDefaults standardUserDefaults]valueForKey:coinType];
    //为了方便 这临时注释一下
    //    NSString *contractAddress = ERC20Dict[@"address"];
    //    NSString *decimals = ERC20Dict[@"decimals"];
    NSString *contractAddress = @"0xd0a6E6C54DbC68Db5db3A091B171A77407Ff7ccf";
    NSString *decimals = @"18";
    NSString *valueHexString = [Payment parseEther:value].hexString;
    NSString *valueWithoutPrefix = [valueHexString substringFromIndex:2];
    NSMutableString *valuePadding = [[NSMutableString alloc]init];
    if (![decimals isEqualToString:@"18"]) {
        double doubleDecimals =(double)pow(10, [NSNumber numberWithString:decimals].integerValue);
        NSDecimalNumber *tempDecimalNumber = [NSDecimalNumber decimalNumberWithString:value];
        long long tempValue =  tempDecimalNumber.doubleValue * doubleDecimals;
        //10进制转16进制
        valueWithoutPrefix = [self getHexByDecimal:tempValue];
    }
    for (int i = 0; i < 64 - valueWithoutPrefix.length; i ++) {
        [valuePadding appendString:@"0"];
    }
    [valuePadding appendString:valueWithoutPrefix];
    NSString *contracDtataString = [NSString stringWithFormat:@"a9059cbb000000000000000000000000%@%@", [address substringFromIndex:2], valuePadding];
    InfuraProvider *provider = [[InfuraProvider alloc] initWithTestnet:NO accessToken:@"uSjnFOfWwzf9edKibZ0V"];
    Transaction *transaction = [[Transaction alloc] init];
    
    NSString *fromAddress = [NSString stringWithFormat:@"%@", account.address];
    [UseChainNetSwift getNonceWithAddress:fromAddress resource:^(id result, NSError * error) {
        NSNumber *nonce = [self numberHexString:result];
        int intNonce = [nonce intValue];
        transaction.nonce = intNonce;
        transaction.gasLimit = [BigNumber bigNumberWithDecimalString:gaslimit];
        transaction.gasPrice = [BigNumber bigNumberWithDecimalString:gasPrice];
        transaction.toAddress = [Address addressWithString:contractAddress];
        transaction.value = [BigNumber constantZero];
        transaction.data = [NSData dataWithHexString:contracDtataString];
        [account sign:transaction];
        NSData *signedTransaction = [transaction serialize];
        [[provider sendTransaction:signedTransaction] onCompletion:^(HashPromise *promise) {
            if (promise.error) {
                finished(nil, promise.error);
            } else {
                finished(promise.result, nil);
            }
        }];
    }];
}

+(void)             TempAccount:(Account *)account
                sendCopycatCoin:(NSString *)coinType
        TransactionWithGaslimit:(NSString *)gaslimit
                      publicKey:(NSString *)publickey
                       GasPrice:(NSString *)gasPrice
                       AndValue:(NSString *)value
                      ToAddress:(NSString *)address
                       finished:(void (^)(id result, NSError *error))finished {
    
    NSString *contractAddress = @"0xd0a6E6C54DbC68Db5db3A091B171A77407Ff7ccf";
    NSString *decimals = @"18";
    NSString *valueHexString = [Payment parseEther:value].hexString;
    NSString *valueWithoutPrefix = [valueHexString substringFromIndex:2];
    NSMutableString *valuePadding = [[NSMutableString alloc]init];
    if (![decimals isEqualToString:@"18"]) {
        double doubleDecimals =(double)pow(10, [NSNumber numberWithString:decimals].integerValue);
        NSDecimalNumber *tempDecimalNumber = [NSDecimalNumber decimalNumberWithString:value];
        long long tempValue =  tempDecimalNumber.doubleValue * doubleDecimals;
        //10进制转16进制
        valueWithoutPrefix = [self getHexByDecimal:tempValue];
    }
    for (int i = 0; i < 64 - valueWithoutPrefix.length; i ++) {
        [valuePadding appendString:@"0"];
    }
    [valuePadding appendString:valueWithoutPrefix];
    NSString *contracDtataString = [NSString stringWithFormat:@"f2c298be00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000035%@0000000000000000000000", publickey];
    InfuraProvider *provider = [[InfuraProvider alloc] initWithTestnet:NO accessToken:@"uSjnFOfWwzf9edKibZ0V"];
    Transaction *transaction = [[Transaction alloc] init];
    
    NSString *fromAddress = [NSString stringWithFormat:@"%@", account.address];
    [UseChainNetSwift getNonceWithAddress:fromAddress resource:^(id result, NSError * error) {
        NSNumber *nonce = [self numberHexString:result];
        int intNonce = [nonce intValue];
        transaction.nonce = intNonce;
        transaction.gasLimit = [BigNumber bigNumberWithDecimalString:gaslimit];
        transaction.gasPrice = [BigNumber bigNumberWithDecimalString:gasPrice];
        transaction.toAddress = [Address addressWithString:contractAddress];
        transaction.value = [BigNumber constantZero];
        transaction.data = [NSData dataWithHexString:contracDtataString];
        [account sign:transaction];
        NSData *signedTransaction = [transaction serialize];
        [[provider sendTransaction:signedTransaction] onCompletion:^(HashPromise *promise) {
            if (promise.error) {
                finished(nil, promise.error);
            } else {
                finished(promise.result, nil);
            }
        }];
    }];
}

+(void)getBalanceFromAddress:(NSString *)address finished:(void (^)(id, NSError *))finished {
    
    [UseChainNetSwift getBalanceWithAddress:address resource:^(id result, NSError * error) {
        finished(result, error);
    }];
}

+(void)getEstimateGasfinished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getEstimateGasToAddress:@"0xAD12Ed26b3d8F2E31d9BA864Ffa07D0d2d5EE5A0" resource:^(id result, NSError * error) {
        finished(result, error);
    }];
}
+(void)getTxListByAddress:(NSString *)address finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getTxListWithAddress:address resource:^(id result, NSError * error) {
        finished(result, error);
    }];
}
+(void)getCopycatBalanceWithCoinType:(NSString *)coinType andAddress:(NSString *)address finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getCopycatBalanceWithCopyCatCoinType:coinType address:address resource:^(id result, NSError * error) {
        finished(result, error);
    }];
}

+ (void)confimBlockOfTx:(NSString *)txHashStr finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getCurrentBlockNumWithResource:^(id result, NSError * error) {
        if (!error) {
            NSString *blockNumHexString = result[@"result"];
            NSInteger currentBlcokNum = [self numberHexString:blockNumHexString].integerValue;
            [UseChainNetSwift getTransactionByHashWithHash:txHashStr resource:^(id result, NSError * error) {
                NSLog(@"%@", txHashStr);
                NSLog(@"%@", result);
                if (result[@"result"] == nil || [result[@"result"] isEqual:[NSNull null]]) {
                    return;
                }
                NSString *txBlockNumHexString = result[@"result"][@"blockNumber"];
                NSInteger txBlcokNum = [self numberHexString:txBlockNumHexString].integerValue;
                NSInteger confimBlockNum = currentBlcokNum - txBlcokNum;
                NSString *confimBlockNumStr = [NSString stringWithFormat:@"%ld", (long)confimBlockNum];
                finished(confimBlockNumStr, error);
            }];
        }
    }];
}

+ (void)isPending:(NSString *)txHashStr finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getTransactionByHashWithHash:txHashStr resource:^(id result, NSError * error) {
        NSLog(@"%@", result[@"result"]);
        NSNull *temp = result[@"result"];
        if (temp == [NSNull null]) {
            
            finished(@"isPending", error);
        } else {
            finished(@"isComplete", error);
        }
    }];
}

+ (BOOL)isValidMnemonicWord:(NSString *)word {
    return [Account isValidMnemonicWord:word];
}

+ (void)getERC20AddressInfoWithAddress:(NSString *)address finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getERC20AddressInfoWithAddress:address resource:^(id result, NSError * error) {
        finished(result, error);
    }];
    
}

+ (void)getAltcoinBalanceWithContractAddress:(NSString *)contractAddress andAddress:(NSString *)address finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getAltcoinBalanceWithContractAddress:contractAddress address:address resource:^(id result, NSError * error) {
        finished(result, error);
    }];
}

// 16进制转10进制
+ (NSNumber *) numberHexString:(NSString *)aHexString
{
    // 为空,直接返回.
    if (nil == aHexString || [aHexString isEqual:[NSNull null]])
    {
        return nil;
    }
    NSScanner * scanner = [NSScanner scannerWithString:aHexString];
    unsigned long long longlongValue;
    [scanner scanHexLongLong:&longlongValue];
    //将整数转换为NSNumber,存储到数组中,并返回.
    NSNumber * hexNumber = [NSNumber numberWithLongLong:longlongValue];
    return hexNumber;
}
/**
 十进制转换十六进制
 
 @param decimal 十进制数
 @return 十六进制数
 */
+ (NSString *)getHexByDecimal:(long long)decimal {
    
    NSString *hex =@"";
    NSString *letter;
    long long number;
    while (decimal != 0) {
        number = decimal % 16;
        decimal = decimal / 16;
        switch (number) {
            case 10:
                letter =@"A"; break;
            case 11:
                letter =@"B"; break;
            case 12:
                letter =@"C"; break;
            case 13:
                letter =@"D"; break;
            case 14:
                letter =@"E"; break;
            case 15:
                letter =@"F"; break;
            default:
                letter = [NSString stringWithFormat:@"%lld", number];
        }
        hex = [letter stringByAppendingString:hex];
    }
    return hex;
}
//MARK: -替补
+ (void)ethplorerConfimBlockOfTx:(NSString *)txHashStr finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getTransactionFromEthploreByTxHashWithHash:txHashStr resource:^(id result, NSError * error) {
        finished(result[@"confirmations"], error);
    }];
}
+ (void)ethploreIsPending:(NSString *)txHashStr finished:(void (^)(id result, NSError *error))finished {
    [UseChainNetSwift getTransactionFromEthploreByTxHashWithHash:txHashStr resource:^(id result, NSError * error) {
        
    }];
}

@end

