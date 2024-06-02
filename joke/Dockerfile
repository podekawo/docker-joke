# use alpine because it's much smaller in size, 

## here I do a 2 step build by 
# firstly defining a "builder" image to create smaller container which builds project 
# (instead of manualy do this)  
FROM node:22-alpine AS builder

# create app dir
RUN mkdir /app

# copy '.' - everything in the app folder into container
COPY . /app

# go to app dir and exec installation of all packages and build the project
RUN cd /app && npm install && npm run build 


## creating real container

FROM node:22-alpine

RUN mkdir /app

# copy all relevant files from previously created image
COPY --from=builder /app/build /app/build
# copy package.json to app folder
COPY --from=builder /app/package.json /app/

# install only production dependencies, ignore all dev
# also clean the cache to make the image a little bit smaller
# RUN cd /app && \ 
#   npm install --production && \
#   npm cache clean

RUN cd /app && npm install --production

# set app as work dir
WORKDIR /app

# add command to start app
CMD ["node", "build/index.js"]