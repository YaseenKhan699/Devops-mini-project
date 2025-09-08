# Use Node.js official image
FROM node:18

# Create app directory
WORKDIR /app

# Copy package.json and package-lock.json first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the project
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["npm", "run", "dev"]
