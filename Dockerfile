FROM registry.access.redhat.com/3scale-amp21/apicast-gateway

# Copy customized source code to the appropriate directory
COPY ./configuration.lua /opt/app-root/src/src/
