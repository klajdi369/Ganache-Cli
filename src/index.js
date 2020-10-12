var http = require("http");
const { spawn } = require("child_process");

let port = process.env.PORT || 3000;
const spawnGanache = spawn("ganache-cli", ["-b 9", "-n", "-u 0", "-p " + port, "--host 0.0.0.0]);

console.log(port);

let output;
spawnGanache.stdout.on("data", (data) => {
  console.log(`stdout: ${data}`);
  output += data;
});

//create a server object:
http
  .createServer(function (req, res) {
    res.write(output); //write a response to the client
    res.end(); //end the response
  })
  .listen(8080); //the server object listens on port 8080
