#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
FROM node:10-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN addgroup -S appgroup && adduser -S appuser -G appgroup -u 1001

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD [ "node", "app.js" ]
