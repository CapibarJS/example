# CapibarJS/Example
Package @capibar/core: https://github.com/Pysdbi/capibar-js

## Init docker
```shell
docker-compose up -d --build postgres-local
```

## Install dependencies
```shell
npm install
# or yarn
yarn install
```

## Run server
```shell
npm run start
# or yarn
yarn start
```

## Testing
> Go to http://127.0.0.1:8080 and write in console
>
> HTTP:
> ```js 
> await rpc.http.ship.create({ name: 'John Kek' }) 
> /* > { name: 'John Kek', status: 'created' } */
> ```` 
> WebSocket:
> ```js
> await rpc.ws.ship.create({ name: 'web socket' })
> /* > { name: 'web socket', status: 'created' } */
> ```

