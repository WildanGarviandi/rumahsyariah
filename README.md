Rumah Syariah

This project is open project to build open source property listing

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.js`. The page auto-updates as you edit the file.

## Run Debug with Docker
To deploy easier let's contain this repo under container with Docker

### Build Image

``` bash
docker build . -t ghcr.io/wildangarviandi/rumahsyariah
```

### Run the Image

```bash
docker run -p 3000:3000 ghcr.io/wildangarviandi/rumahsyariah
```