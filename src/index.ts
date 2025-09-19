import app from "./app.js";
import { env } from "./env.js";

const port = env.PORT || 2050;
const server = app.listen(port, "0.0.0.0");

server.on("error", (err) => {
  if ("code" in err && err.code === "EADDRINUSE") {
    console.error(`Port ${env.PORT} is already in use. Please choose another port or stop the process using it.`);
  }
  else {
    console.error("Failed to start server:", err);
  }
  process.exit(1);
});
