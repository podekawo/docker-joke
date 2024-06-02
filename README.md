# Build image with: 

sudo docker build -t joke . 


## here I do a 2 step build by firstly defining a "builder" image to create smaller container which builds project (instead of manualy do this)

- use alpine because it's much smaller in size,

FROM node:22-alpine AS builder

- create app dir

RUN mkdir /app

- copy '.' - everything in the app folder into container

COPY . /app

- go to app dir and exec installation of all packages and build the project

RUN cd /app && npm install && npm run build 


# creating real container

FROM node:22-alpine

RUN mkdir /app

- copy all relevant files from previously created image

COPY --from=builder /app/build /app/build

- copy package.json to app folder

COPY --from=builder /app/package.json /app/

- install only production dependencies, ignore all dev

RUN cd /app && npm install --production

- set app as work dir

WORKDIR /app

- add command to start app

CMD ["node", "build/index.js"]


# there is a run.sh file for server run but to manually do this: 

- run server with: 

sudo docker run --rm -d -p 3000:3000 --name sveltekit-joke joke

- stop server with:

sudo docker stop sveltekit-joke
