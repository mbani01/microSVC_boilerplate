import express from 'express';
import * as dotenv from "dotenv";
import bodyParser from "body-parser"

dotenv.config();
const PORT = process.env.PORT || 3000;
const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.listen(PORT , ()=>{
	console.log("Service Running on PORT ", PORT);
});