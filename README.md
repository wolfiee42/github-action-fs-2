# Express API Starter with Typescript

A JavaScript Express v5 starter template with sensible defaults.

How to use this template:

```sh
pnpm dlx create-express-api@latest --typescript --directory my-api-name
```

Includes API Server utilities:

- [morgan](https://www.npmjs.com/package/morgan)
  - HTTP request logger middleware for node.js
- [helmet](https://www.npmjs.com/package/helmet)
  - Helmet helps you secure your Express apps by setting various HTTP headers. It's not a silver bullet, but it can help!
- [cors](https://www.npmjs.com/package/cors)
  - CORS is a node.js package for providing a Connect/Express middleware that can be used to enable CORS with various options.

Development utilities:

- [typescript](https://www.npmjs.com/package/typescript)
  - TypeScript is a language for application-scale JavaScript.
- [tsx](https://www.npmjs.com/package/tsx)
  - The easiest way to run TypeScript in Node.js
- [eslint](https://www.npmjs.com/package/eslint)
  - ESLint is a tool for identifying and reporting on patterns found in ECMAScript/JavaScript code.
- [vitest](https://www.npmjs.com/package/vitest)
  - Next generation testing framework powered by Vite.
- [zod](https://www.npmjs.com/package/zod)
  - Validated TypeSafe env with zod schema
- [supertest](https://www.npmjs.com/package/supertest)
  - HTTP assertions made easy via superagent.

## Setup

```
pnpm install
```

## Lint

```
pnpm run lint
```

## Test

```
pnpm run test
```

## Development

```
pnpm run dev
```

## Production Deployment with PM2

This application is configured for server deployment using PM2 process manager.

### Server Setup

1. Run the setup script on your server:
```bash
chmod +x deploy-setup.sh
./deploy-setup.sh
```

2. Update the `ecosystem.config.js` file with your server details:
   - Replace `your-server-ip` with your actual server IP
   - Update the repository URL
   - Adjust paths as needed

### Manual Deployment

1. Install dependencies and build:
```bash
pnpm install --frozen-lockfile
pnpm run build
```

2. Start the application with PM2:
```bash
# Production mode
pnpm run pm2:start

# Development mode
pnpm run pm2:dev
```
