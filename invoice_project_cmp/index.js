const {
  exec
} = require("child_process");
const express = require('express');
const path = require('path');
var cors = require('cors')
var fs = require('fs');

const app = express();
app.use(cors())
app.use(express.text());
const port = process.env.PORT || 8080;

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});

app.post('/invoice', function (req, res) {
  fs.writeFileSync("./invoice/invoice.xml", req.body);

  exec(`java -jar .\\fop.jar -xml .\\invoice\\invoice.xml -xsl .\\invoice\\invoice.xsl -pdf .\\invoice\\invoice.pdf`, (error, stdout, stderr) => {
    if (error) {
      console.log(`error: ${error.message}`);
      // return res.status(400).send();
    }
    if (stderr) {
      console.log(`stderr: ${stderr}`);
      // return res.status(400).send();
    }
    //console.log(`stdout: ${stdout}`);

    var data = fs.readFileSync('./invoice/invoice.pdf');
    res.contentType("application/pdf");

    fs.unlinkSync('./invoice/invoice.pdf');
    fs.unlinkSync('./invoice/invoice.xml');


    return res.send(data);
  });
})

app.listen(port);
console.log('Server started at http://localhost:' + port);