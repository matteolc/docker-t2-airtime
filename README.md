# Docker T2-Airtime Demo

This image allows you to run and test in an isolated environment the [TransferTo-Airtime-API]() gem. 

Once deployed you can access the API at (http://localhost:8080/).

## Requirements

[Docker CE](https://www.docker.com/) installed on your local or development machine.

## Preparation

Set your TransferTo credentials in `docker-compose.yml`:

    T2_SHOP_USER=
    T2_AIRTIME_KEY=

## Run with docker-compose

You can use the provided `docker-compose.yml` file to run the image:

```bash
docker-compose up
```

## Run in Swarm mode

You can use the provided `run.sh` script to deploy the `docker-compose.yml` stack in Swarm mode:

```bash
./run.sh
```

After playing around, you can cleanup Docker with:

```bash
./cleanup.sh
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/docker-t2-airtime. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The container is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/t2_airtime/blob/master/CODE_OF_CONDUCT.md).

