const express = require("express");
const path = require("path");
var app = express();

app.set("port", process.env.PORT || 8080);

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

app.use("/", (req, res, next) => {
  if (req.path.endsWith(".html")) {
    res.render("index", { pagina: req.path });
  } else {
    next();
  }
});

app.use(express.static("public_html"));

app.listen(app.get("port"), () => {
  console.log("Aplicacion escuchando en el puerto: " + app.get("port"));
});
