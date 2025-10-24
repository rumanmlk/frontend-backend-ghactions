# FROM node:14-alpine

# WORKDIR /app

# # add '/app/node_modules/.bin' to $PATH
# ENV PATH /app/node_modules/.bin:$PATH
# # install application dependencies
# COPY package*.json ./
# RUN npm install
# # RUN npm install react-scripts -g

# # copy app files
# COPY . .

# EXPOSE 3000
# CMD ["npm", "start"]


# ---------- Build Stage ----------
FROM node:18-alpine AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy all files and build the app
COPY . .
RUN npm run build

# ---------- Production Stage ----------
FROM nginx:alpine
# Copy build output to nginx's public directory
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
