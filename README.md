# Integrating SOAP based Web Services into Red Hat 3scale API Management

## Blog
See ***********         MY BLOG         *************** for context and high level details     https://docs.google.com/document/d/1X4omcsZZ3gzMQYEDfPENBmuwaOrMvUePcSMDacTBSTA/edit#

## Overview
Aside from some minor configuration on the 3scale API Manager web interface, the solution mainly involves a small customization to one of the *Lua* scripting source files used by the gateway, *configuration.lua*. For precise details on the customization, use a *diff* tool on the file in this repo with the [one we customized](https://github.com/3scale/apicast/blob/master/apicast/src/configuration.lua) 
We create a Docker image using the standard APICast (aka 3scale Gateway) image and just override this lua file. * Note as discussed in the ***********          BLOG         ***************, we use a HTTP Header called SOAPAction. This is because, by convention, this header identifies the SOAP Operation. Should you wish to use another, fork this repo and modify [this line](https://github.com/tnscorcoran/soap-apicast/blob/master/configuration.lua#L200) *

## Instructions
To implement, you simply follow the *3scale API Manager configuration* section below. Then, depending on your desired implementation, follow either the *Raw Docker* or *Openshift* gateway configuration section that follows.  

### 3scale API Manager configuration
On the 3scale API Manager we configure the SOAP endpoint the same way we configure a REST endpoint.

**_Mapping SOAP Endpoint URL path to 3scale method:_**
![Mapping](https://raw.githubusercontent.com/tnscorcoran/soap-apicast/master/_images/1-Mapping.png)
In my case, I use a fictitious Geo-Location SOAP Service - identified by the path /geo-endpoint. I map this to a logical 3scale method geo-service. This will cause all SOAP requests to this endpoint to be authorized and reported to 3scale under this method.

Additionally, in order to get the fine-grained, operation-level access control and traffic visibility, we define 3scale metrics for each operation. Navigate to API -> Your SOAP API -> Definition. Create a Method for each endpoint - in my case just one geo service. Additionally create a Metric for each SOAP operation your Service exposes. In my case I’ve configured possible operations city, country etc.

**_API Definition with method and multiple metrics representing operations:_**
![API Definition](https://raw.githubusercontent.com/tnscorcoran/soap-apicast/master/_images/2-method-metric-definition.png)

At this point, in your 3scale Application Plans (access policies), you could now control access with rate limits to each of these metrics and the method.

In your Analytics section, you now get overall traffic visibility at Method level and at individual metric or operation level.

**_Method level visibility showing overall traffic to SOAP Service endpoint:_**
![Method level visibility](https://raw.githubusercontent.com/tnscorcoran/soap-apicast/master/_images/3-method-level-analytics.png)


**_Metric level visibility showing traffic to individual SOAP operations:_**
![Metric level visibility](https://raw.githubusercontent.com/tnscorcoran/soap-apicast/master/_images/4-metric-operation-level-analytics.png)


### Raw Docker gateway configuration




### Openshift gateway configuration




