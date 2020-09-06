const express = require("express");
var app = express();

app.set("port", process.env.PORT || 8080);

app.use(express.static("public_html"));

app.listen(app.get("port"), () => {
  console.log("Aplicacion escuchando en el puerto: " + app.get("port"));
});
