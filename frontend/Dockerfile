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

# Fix OpenSSL issue for webpack/react-scripts
ENV NODE_OPTIONS=--openssl-legacy-provider

# Install dependencies
COPY package*.json ./

CMD ["response=$(curl --request GET --url https://api.render.com/v1/services/srv-d3tomek9c44c73e71740 \
--header 'accept: application/json' \
--header 'authorization: Bearer rnd_UgTGwChXEdwL1WXYtDlYL21i1mlE')\
REACT_APP_API_URL=$(echo "$response" | jq -r '.serviceDetails.url')\
touch .env\
echo "REACT_APP_API_URL=$REACT_APP_API_URL" >> .env\
"]

RUN npm install

ARG REACT_APP_API_URL=${REACT_APP_API_URL}

ENV REACT_APP_API_URL=${REACT_APP_API_URL}

RUN echo "$REACT_APP_API_URL"


# Copy all files and build the app
COPY . .
RUN npm run build 

# ---------- Production Stage ----------
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
