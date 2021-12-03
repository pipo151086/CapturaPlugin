/********* ZyTPluginBioWU.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <ZyTBiometrico/ZyTBiometrico.h>

@interface ZyTPluginBioWU : CDVPlugin {
    // Member variables go here.
}

- (void)coolMethod:(CDVInvokedUrlCommand*)command;
@end

@implementation ZyTPluginBioWU

- (void)coolMethod:(CDVInvokedUrlCommand*)command
{
    //[tiDoc, nuDoc , idSolicitud , nuOperacionEmpresa , token , isDialog]);
    dispatch_async(dispatch_get_main_queue(), ^{
    NSString* tiDoc = [command.arguments objectAtIndex:0];
    NSString* nuDoc = @"73106856";//[command.arguments objectAtIndex:1];
    NSString* idSolicitud = @"7015";//[command.arguments objectAtIndex:2];
    NSString* nuOperacionEmpresa = @"111";//[command.arguments objectAtIndex:3];
    NSString* token = @"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c3VFbXBzSWQiOjY3MCwidXN1QXBsSWQiOjEsInVzZXJfbmFtZSI6IlJQLVFBUEFRIiwidHVzdUlkIjoyLCJ1c3VDb0ludGVybm8iOiJSUC1RQVBBUSIsImF1dGhvcml0aWVzIjpbInJNK1lwREVkcjdBa2hzdElMWkdIcXNPWldRUT0iLCJraDg5T2R1b09kcEg1Y2pUb2tvYmhBdDFWRUE9IiwieDBGNE0yNHhvWXF1WE5IZUhYTC8wQjAwQ253PSIsIkVMWW4xK1JKQ3ZhNnEzQ05RWmFPNlJjdjRBcz0iLCJEaDl5N24yWS8zZ3JTUXZpM0NGYTIxMmNINlU9IiwiRFMvdXVYY29hUHA1VGprdWhKVDhBaGVFNFAwPSIsIkpoUEV2bk5qRjhiMFg3bXYwTXY0VVlqVVhndz0iLCJWSGpiOG5DdDJtRGk2RVBUSFMzWGxhR2RTb2c9IiwiZXNiWGVRT2pSSjhZZmY1aTMvb3JYSkJDTE1FPSIsImJaaDVJRjV3RytBM0N2cXNWZ09lUTdBWXd1OD0iLCJwWGNLRVBIQUxkRGJ0d2UwbkpUS0owcE4xUDA9IiwicStLZEVpakMzLzNSSXhjbEZ0N21PZGlhU2F3PSIsInlNMHd1UW12UW5HQ0UyK1ZoK1RQT05SMFROVT0iLCIxb2QwMmtaUFVveUtqa3JtdGwvVExEUENSU2s9IiwiTzFNRGdBa0VIRG5QdHMrcFcvL0pZUCtBd1ZzPSIsInNBQmJCVXUwZmdWQmNWOEc1R3VGOEcxRlVITT0iLCJJcWlxTFd2Q2xpazZJTHRCU3c0QjlzSGpMTUk9IiwiL1QvRUpFUHpzMTF3c2NndkE5OEVBSlNBekZBPSIsIjZJb0ZHQU9SSDNHcGUxYmlqdlB4MDY1bVlZUT0iLCJRNCtKUExnblJTRkVSZjJaN0cvdUdmYVlIcHc9IiwiVGhqR3h4N1JzR0pHU3N5aGhQUUpzTGsySVgwPSIsInJOYmtxb0wwUjJXODMrL3g0WlFFeHlHdXF1QT0iLCIrcEdPc0NWZlJSRTdLM0lLcGt0N0hTRkFrZE09IiwiYXJyUmNqeitjczU3eE1XVUtWd003aU9rK3l3PSIsImdLc1BNdCt5cFdBVk1GRTd1S2oxVmh4WnZuZz0iLCJMZ2d3Q1E2dG5JaWhaMnFrYWhSeDZMQ2Q4dmM9IiwiTG1YQnBvZ2ZNRm9HSmZhclBaTXdJOHNCSFBjPSIsInhxVnB3blN4bm1ucGhrOWZJY05jU3lkQ3RUaz0iLCJTS21iQk9kL2VjaEtzWThreHBjeHl2SWRvWEU9IiwiQ2NpTjRuZ0JsM3BuM3doSWI5NzFLTmFmV2w0PSIsInI2SUY1d1FzZWZBUkVVcmo2RGNBWDArVElnOD0iLCJWR3o5RjNPZnFUeGFQWUxGclNnQVBlYmxNUjg9IiwidkpteWROUmQ2NTIzekEzaUlnLzRJWTN3SS9NPSIsInhrbmFBRUZrL29hYjRnY0NjV3lCZEhoU3ZHST0iLCIrLzdObEN0b1RWd0c5ZXMwMG9jMGxVNktkNnM9IiwiRWJXRnVyajJWbzFrQTYyODh0bDg0Nk9LMWdRPSIsIjJvU2dyZnVPcG0wd0F6ajc4V2xwOXlqMkFCbz0iLCJ5NXQ5V0ZUaTcvUmFvK1lPTmI0YnJ4d0NhRWs9Il0sImNsaWVudF9pZCI6IjIwNTIxMzA4MzIxIiwib3BjaW9uZXMiOlt7ImdycG9JZCI6NCwiZ3Jwb0Rlc2NyaXBjaW9uIjoiQklPTUVUUklBIiwiZ3Jwb0ljb25vIjoiY2hlY2tfYm94Iiwic2VnT3BjaW9uZXMiOlt7Im9wY0lkIjoyNiwib3BjRGVzY3JpcGNpb24iOiJBdXRlbnRpY2FjacOzbiBCaW9tZXRyaWNhIiwib3BjQ29udHJvbGFkb3IiOiJhdXRlbnRpY2FjaW9uYmlvbWV0cmljYSIsIm9wY0ljb25vIjoicGVyc29uIn0seyJvcGNJZCI6MjcsIm9wY0Rlc2NyaXBjaW9uIjoiQ29uc3VsdGEgU29saWNpdHVkIiwib3BjQ29udHJvbGFkb3IiOiJjb25zdWx0YXNvbGljaXR1ZCIsIm9wY0ljb25vIjoic2VhcmNoIn1dLCJhcGxEZXNjcmlwY2lvbiI6IlBDRSBGSVJNQSBDT04gQklPTUVUUklBIn0seyJncnBvSWQiOjMsImdycG9EZXNjcmlwY2lvbiI6IkNPTlRSQVRPUyIsImdycG9JY29ubyI6ImNoZWNrX2JveCIsInNlZ09wY2lvbmVzIjpbeyJvcGNJZCI6NDIxLCJvcGNEZXNjcmlwY2lvbiI6IkdlbmVyYWNpw7NuIGRlIGNvbnRyYXRvcyIsIm9wY0NvbnRyb2xhZG9yIjoiZ2VuZXJhY2lvbmNvbnRyYXRvIiwib3BjSWNvbm8iOiJub3RlX2FkZCJ9LHsib3BjSWQiOjI0LCJvcGNEZXNjcmlwY2lvbiI6IkdlbmVyYXIgQ29udHJhdG8iLCJvcGNDb250cm9sYWRvciI6ImNhcmdhcmNvbnRyYXRvIiwib3BjSWNvbm8iOiJub3RlX2FkZCJ9LHsib3BjSWQiOjI4LCJvcGNEZXNjcmlwY2lvbiI6IkJhbmRlamEgZGUgRmlybWFzIiwib3BjQ29udHJvbGFkb3IiOiJiYW5kZWphZmlybWEiLCJvcGNJY29ubyI6InNlYXJjaCJ9XSwiYXBsRGVzY3JpcGNpb24iOiJQQ0UgRklSTUEgQ09OIEJJT01FVFJJQSJ9XSwidXN1SWQiOjY0MywidXN1UGVySWQiOjgyMjksInNjb3BlIjpbInJlYWQiLCJ3cml0ZSIsInRydXN0Il0sInN1Y3VEZXNjcmlwY2lvbiI6IlBSSU5DSVBBTCIsImV4cCI6MjYzNzg1NzE4OSwianRpIjoiZjcwZmJjYTQtYjkyMS00ODEwLWI2MzQtNTk2OTllOGVmNTEzIn0.T-8-vpJv_SNkEgdYphkGSbblGInJCQvKhLgEUPNb-0nsOq2fG-I_N9D28REltAxKkTTerCIv6GLTX3A7bwMWxA-9ib5PRX2hJ5ybW3BuuQkMJfrcxKg3Sk3oz72aiCj2Q6nEv6-4c0YtDJBnsYv8AJvU5GDxaLJl1wqKlE5EjPMIJHpvlq7GJBG34OWbAzXDes0wrhRq_o1lOroW4qXzpIsk7jifa97DkxTkwDNTIU4X-LzWpVbjVH_z7BTm1G6KzC3xJIksVA8CiPy_P0IuLxl6UoBqgUOOovFQlAIdyEMMffq5dJRIQpaW1GKzzsmiYDfZZrG5DVDPUUSsuNAIeg";
    //[command.arguments objectAtIndex:4];
    
    ZyTAutenticaRequest *request = [ZyTAutenticaRequest new];
    request.tipoDocumento = tiDoc ;
    request.numDocumento = nuDoc;
    request.nuoperacionEmps = nuOperacionEmpresa;
    request.idSolicitud = idSolicitud;
    request.tokenAuth=token;
    
    ZyTBiomatch *biomatch = [[ZyTBiomatch new] initWithUI:self.viewController];
   
    [biomatch verificacionFacial:request
                  withCompletion:^(ZyTAutenticaResponse * _Nonnull response) {
        
        
            
            NSString* coError =  ([response.coError length] == 0)? @"": response.coError;
            NSString* deError = ([response.deError length] == 0)? @"": response.deError;
            NSString* bioCodErrorReniec = ([response.bioCodErrorReniec length] == 0)? @"": response.bioCodErrorReniec;
            NSString* bioDeErrorReniec = ([response.bioDeErrorReniec length] == 0)? @"": response.bioDeErrorReniec;
            NSString* bioScore = ([response.bioScore length] == 0)? @"": response.bioScore;
            NSString* bmoIdSolicitud = ([response.bmoIdSolicitud length] == 0)? @"": response.bmoIdSolicitud;
            NSString* bioIdTransaccion = ([response.bioIdTransaccion length] == 0)? @"": response.bioIdTransaccion;
            NSString* bioNuSolicitud = ([response.bioNuSolicitud length] == 0)? @"": response.bioNuSolicitud;

            NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
            
            [myDictionary setObject:coError  forKey:@"coError"];
            [myDictionary setObject:deError  forKey:@"deError"];
            [myDictionary setObject:bioCodErrorReniec  forKey:@"codErrorReniec"];
            [myDictionary setObject:bioDeErrorReniec  forKey:@"deErrorReniec"];
            [myDictionary setObject:bioScore  forKey:@"bioScore"];
            [myDictionary setObject:bmoIdSolicitud  forKey:@"idSolicitud"];
            [myDictionary setObject:bioIdTransaccion  forKey:@"bioIdTransaccion"];
            [myDictionary setObject:bioNuSolicitud  forKey:@"bioNuSolicitud"];

            // Some blocking logic...
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:myDictionary];
            // The sendPluginResult method is thread-safe.
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
      
        
    }];
    
    });
}

@end
