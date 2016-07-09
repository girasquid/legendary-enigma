# legendary-enigma

A tiny sinatra app for testing deploy scripts.

## Running it

The app expects two environment variables to be filled in:

- `DATABASE_URL` - for example, `postgres://username:password@127.0.0.1:3000/database`
- `REDIS_URL` - for example, `redis://username-that-isnt-used:password@127.0.0.1:3000`

Once those are set, if you run the app with `rackup` you'll be able to hit these URLs:

- `/http` - emits "hello, world!" if sinatra is up
- `/postgres` - emits "hello, from postgres" if can connect to postgres and query tables
- `/redis` - emits "hello, from redis" if can connect to redis and ping

If any of these endpoints return a non-200 status code, you know that the app can't talk to the database/redis that you've configured.

## Checking from the command-line

```bash
$ curl -I localhost:9292/{http,redis,postgres}
```
