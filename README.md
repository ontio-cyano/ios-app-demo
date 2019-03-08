# iOS-app-demo

iOS APP demo is a demo support wake up wallet for login and invoke smartcontract.

## Project configuration

Add `query schemes` to the arousal project

Open `info.plist` in the arousal project

Click to open using `Open As Source Code`

Add the following code

#### 1、Support cyano 

```
<key>LSApplicationQueriesSchemes</key> 
  <array> 
  <string>ontprovider</string> 
</array>
```

####    2、Support ONTO

```
<key>LSApplicationQueriesSchemes</key> 
  <array> 
  <string>ontoprovider</string> 
</array>
```



####     Login

Request data the same to [Cyano scan qrcode Login](https://github.com/ontio-cyano/CEPs/blob/master/CEPS/CEP1.mediawiki#Login-2)

```
{
	"action": "login",
	"id": "10ba038e-48da-487b-96e8-8d3b99b6d18a",
	"version": "v1.0.0",
	"params": {
		"type": "ontid or account",
		"dappName": "dapp Name",
		"dappIcon": "dapp Icon",
		"message": "helloworld",
		"expire": 1546415363,
		"callback": "http://127.0.0.1:80/login/callback"
	}
}
```

1、Check if cyano/ONTO App is installed locally

- cyano login

```
NSString *cyanoAppUrl = [NSURL URLWithString:@"ontprovider://ont.io?param="];
BOOL isCanOpenCyano = [[UIApplication sharedApplication] canOpenURL:cyanoAppUrl];
if (!isCanOpenCyano) {
   NSLog(@"Not installed cyano");
}else{
    // TODO Login
}
```

- ONTO login

```
NSString *ONTOAppUrl = [NSURL URLWithString:@"ontoprovider://ont.io?param="];
BOOL isCanOpenONTO = [[UIApplication sharedApplication] canOpenURL:ONTOAppUrl];
if (!isCanOpenONTO) {
NSLog(@"Not installed ONTO");
}else{
// TODO Login
}
```

2、Convert Request data to jsonString

3、UrlEncode on jsonString

4、Convert UrlEncodeString to base64

5、Stitch base64 data into appUrl

- cyano login

```
NSString *urlString = [NSString stringWithFormat:@"ontprovider://ont.io? 
                                                   param=%@",base64];
```

- ONTO login

```
NSString *urlString = [NSString stringWithFormat:@"ontoprovider://ont.io? 
                                                   param=%@",base64];
```

6、Login

```
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] 
                                   options:@{} 
                                   completionHandler:^(BOOL success) {
                                       
}];
```

### Invoke smartcontract

Request data the same to [Cyano scan qrcode Invoke](https://github.com/ontio-cyano/CEPs/blob/master/CEPS/CEP1.mediawiki#Invoke_a_Smart_Contract-2)

```
{
	"action": "invoke",
	"version": "v1.0.0",
	"id": "10ba038e-48da-487b-96e8-8d3b99b6d18a",
	"params": {
		"login": true,
		"qrcodeUrl": "http://101.132.193.149:4027/qrcode/AUr5QUfeBADq6BMY6Tp5yuMsUNGpsD7nLZ",
		"message": "will pay 1 ONT in this transaction",
		"callback": "http://101.132.193.149:4027/invoke/callback"
	}
}
```

1、Check if cyano/ONTO App is installed locally

- cyano Invoke

```
NSString *appUrl = [NSURL URLWithString:@"ontprovider://ont.io?param="];
BOOL isCanOpen = [[UIApplication sharedApplication] canOpenURL:appUrl];
if (!isCanOpen) {
   NSLog(@"Not installed cyano");
}else{
    // TODO Invoke
}
```

- ONTO Invoke

```
NSString *ONTOAppUrl = [NSURL URLWithString:@"ontoprovider://ont.io?param="];
BOOL isCanOpenONTO = [[UIApplication sharedApplication] canOpenURL:ONTOAppUrl];
if (!isCanOpenONTO) {
   NSLog(@"Not installed ONTO");
}else{
    // TODO Invoke
}
```

2、Convert Request data to jsonString

3、UrlEncode on jsonString

4、Convert UrlEncodeString to base64

5、Stitch base64 data into appUrl

- cyano Invoke

```
NSString *urlString = [NSString stringWithFormat:@"ontprovider://ont.io?
                                                   param=%@",base64];
```

- ONTO Invoke

```
NSString *urlString = [NSString stringWithFormat:@"ontoprovider://ont.io?
                                                   param=%@",base64];
```

6、Invoke

```
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] 
                                   options:@{} 
                                   completionHandler:^(BOOL success) {
                                       
}];
```

### 