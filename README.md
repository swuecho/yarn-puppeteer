## Usage

## config jest-puppeteer

the image expects a `jest-puppeteer.config.ci.js` in the test folder. 

```js
module.exports = {
  launch: {
    headless: true,
    executablePath: '/usr/bin/chromium-browser',
    slowMo: 100 // slow down by 100ms
  },
};

```

## docker-compose

```yaml
yarn-puppeteer:
    container_name: "yarn-puppeteer"
    image: "${docker_registry}/yarn-puppeteer:latest"
    volumes:
    - ./puppeteer_tests:/puppeteer_tests
```

### run 

```sh
docker-compose run yarn-puppeteer --cwd /puppeteer_tests install
docker-compose run yarn-puppeteer --cwd /puppeteer_tests test:puppeteer
```

`--cwd /puppeteer_tests` is required, because the test folder is `/puppeteer_tests`. 
set the `workdir` to  `/puppeteer_tests` should also works.

