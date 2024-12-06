# Base image for Kong
FROM kong:latest

# Set the necessary environment variables
ENV KONG_DATABASE=off
ENV KONG_DECLARATIVE_CONFIG=/kong/kong.yml
ENV KONG_PROXY_LISTEN=0.0.0.0:${PORT:-8000}
ENV KONG_ADMIN_LISTEN=0.0.0.0:8001

# Copy the declarative configuration
COPY kongconfig/kong.yml /kong/kong.yml

# Expose the required ports
EXPOSE 8000 8001

# Command to start Kong
CMD ["kong", "start"]