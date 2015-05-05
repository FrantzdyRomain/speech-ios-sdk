/**
 * Copyright 2014 IBM Corp. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "STTConfiguration.h"

@implementation STTConfiguration

@synthesize apiURL = _apiURL;

- (id)init {
    self = [super init];
    
    // set default values
    [self setApiEndpoint:[NSURL URLWithString:WATSONSDK_DEFAULT_STT_API_ENDPOINT]];
    [self setModelName:WATSONSDK_DEFAULT_STT_MODEL];
    [self setAudioCodec:WATSONSDK_AUDIO_CODEC_TYPE_PCM];
    
    return self;
}

/**
 *  setApiUrl - override setter so we can update the NSURL endpoint
 *
 *  @param apiURL
 */
- (void)setApiURL:(NSString *)apiURLStr {
    
    _apiURL = apiURLStr;
    [self setApiEndpoint:[NSURL URLWithString:apiURLStr]];
}

- (NSString*) apiURL {
    return _apiURL;
}


#pragma mark convenience methods for obtaining service URLs

- (NSURL*) getModelsServiceURL {
    
    NSString *uriStr = [NSString stringWithFormat:@"%@%@",self.apiURL,WATSONSDK_SERVICE_PATH_MODELS];
    NSURL * url = [NSURL URLWithString:uriStr];
    return url;
}

- (NSURL*) getModelServiceURL:(NSString*) modelName {
    
    NSString *uriStr = [NSString stringWithFormat:@"%@%@/%@",self.apiURL,WATSONSDK_SERVICE_PATH_MODELS,modelName];
    NSURL * url = [NSURL URLWithString:uriStr];
    return url;
}

- (NSURL*) getWebSocketRecognizeURL {
    
    NSString *uriStr = [NSString stringWithFormat:@"%@%@%@%@/%@%@",WEBSOCKETS_SCHEME,self.apiEndpoint.host,self.apiEndpoint.path,WATSONSDK_SERVICE_PATH_MODELS,self.modelName,WATSONSDK_SERVICE_PATH_RECOGNIZE];
    NSURL * url = [NSURL URLWithString:uriStr];
    return url;
}


@end