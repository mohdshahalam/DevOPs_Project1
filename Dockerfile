# Use the official Nginx image as the base image changes has done
FROM nginx:alpine

# Install necessary tools: zip and unzip
RUN apk add --no-cache zip unzip

# Download the zip file and place it in a temporary directory
ADD https://www.tooplate.com/zip-templates/2137_barista_cafe.zip /tmp/barista_cafe.zip

# Unzip the contents
RUN unzip /tmp/barista_cafe.zip -d /tmp/

# Move the unzipped content to the Nginx HTML folder
# (assuming the zip file extracts to a directory named `2137_barista_cafe`)
RUN mv /tmp/2137_barista_cafe/* /usr/share/nginx/html/

# Expose port 80 to allow traffic to the container
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
