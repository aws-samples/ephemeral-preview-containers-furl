const app = require("express")()
const path = require("path")

app.get("/", function (req, res) {
  res.sendFile(path.join(__dirname, "/index.html"))
})

const port = process.env.PORT || 8080
app.listen(port, () => {
  console.log("listening on http://localhost:%s", port)
})
