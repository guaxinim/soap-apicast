#Integrating SOAP based Web Services into Red Hat 3scale API Management

##Blog
See ***********         MY BLOG         *************** for context and high level details     https://docs.google.com/document/d/1X4omcsZZ3gzMQYEDfPENBmuwaOrMvUePcSMDacTBSTA/edit#

##Overview
They solution involves a small customization to one of the *Lua* scripting source files used by the gateway, *configuration.lua*. For precise details on the customization, use a *diff* tool on the file in this repo with the one we customized: https://github.com/3scale/apicast/blob/master/apicast/src/configuration.lua. 
We create a Docker image using the standard APICast (aka 3scale Gateway) image and just override this lua file.

##Instructions
To implement, you simply follow basic the 3scale API Manager configuration section below. Then, depending on your desired implementation, follow either the *Raw Docker* or *Openshift* gateway configuration section that follows.  

###3scale API Manager configuration
On the 3scale API Manager we configure the SOAP endpoint the same way we configure a REST endpoint. As follows:



###Raw Docker gateway configuration




###Openshift gateway configuration




