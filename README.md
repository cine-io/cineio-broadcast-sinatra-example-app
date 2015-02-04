# [cine.io][cineio] Broadcast Example Application in Sinatra

This is an example application in Ruby and Sinatra showing the capabilities of [cine.io broadcast][cineio-broadcast]. It uses the [cine.io Broadcast JS SDK][cineio-broadcast-js-sdk] and the [cine.io Ruby SDK][cineio-ruby]. This sample app can create streams, publish to them, and play them back.

## Try it on Heroku

Click the button below to magically deploy up this example to your Heroku account. A [cine.io][cineio] plan will automatically be included for free.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/cine-io/cineio-broadcast-sinatra-example-app)

## Run Locally

1. Sign up for your own API key at [cine.io][cineio].
2. Set up your environment:

      ```term
      $ export CINE_IO_PUBLIC_KEY='<your cine.io project public key>'
      $ export CINE_IO_SECRET_KEY='<your cine.io project secret key>'
      ```

3. Bundle your gems:

      ```term
      $ bundle install
      ```

4. Run the server:

      ```term
      $ ruby server.rb
      ```

<!-- external links -->
[cineio]:https://www.cine.io/
[cineio-broadcast]:https://www.cine.io/products/broadcast
[cineio-ruby]:https://github.com/cine-io/cineio-ruby
[cineio-broadcast-js-sdk]:https://github.com/cine-io/broadcast-js-sdk
