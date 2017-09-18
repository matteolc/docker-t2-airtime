# Docker T2-Airtime Demo

This image allows you to run a proxy server to the [Transfer-To](https://www.transfer-to.com/home) Airtime service
using the [T2-Airtime](https://github.com/matteolc/t2_airtime) gem.

## Requirements

[Docker CE](https://www.docker.com/) installed on your local or development machine.

### Setup Transfer-To credentials

1. Make sure you are a registered user of [Transfer-To](https://www.transfer-to.com/home).
2. Enable Two Factor Authentication (2FA) in your [Transfer-To Shop](https://shop.transferto.com) Security Center section
2. Retrieve API key (token) created by Transfer-To Shop.
3. Export your secrets as an environment variables:

```sh
export T2_SHOP_USER=<your_username>
export T2_AIRTIME_KEY=<your_token>
```

4. Export the host allowed to access the API (CORS):
```sh
export CORS_ORIGIN=<your_frontend_address>
```

5. Run:

```sh
docker run -d \
  --name t2_airtime \
  -p 3000:3000 \
  -e T2_SHOP_USER \
  -e T2_AIRTIME_KEY \
  -e CORS_ORIGIN \
  voxbox/t2_airtime
docker logs t2_airtime -f  
```

## License

The container is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

