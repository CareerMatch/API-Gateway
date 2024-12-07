# Use the official Kong Gateway image
FROM kong:latest

# Copy the Kong configuration file to the container
COPY kongconfig/kong.yml /usr/local/kong/declarative/kong.yml

# Expose the required Kong ports
EXPOSE 8000 8443 8001

# Set environment variables for declarative mode
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yml
ENV KONG_PROXY_ACCESS_LOG=/dev/stdout
ENV KONG_ADMIN_ACCESS_LOG=/dev/stdout
ENV KONG_PROXY_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_ERROR_LOG=/dev/stderr
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001
ENV KONG_PROXY_LISTEN="0.0.0.0:8000,0.0.0.0:8443 ssl"  

# Start Kong
CMD ["kong", "docker-start"]