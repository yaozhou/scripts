#!/usr/bin/nodejs

if (process.argv.length != 3) {
	console.log("error : " + process.argv[1] + ": input html file") ;
	process.exit() ;
}


var fs = require('fs') ;
var cp = require('child_process') ;

console.log(process.argv) ;

//filename = "/home/yao/develop/touying/xiaoshuai/src.html" ;
filename = process.argv[2] ;
var str = fs.readFileSync(filename).toString() ;
var ary = str.match(/src="[^"]+"/g) ;

for (var i = 0; i < ary.length; i++) {
	var url = ary[i].match(/http:\/\/[^"]+/g)[0] ;
	
	var cmd = "wget " + url + " -O out//" + (100+i) + ".jpg"
	console.log(cmd) ;
	cp.exec(cmd) ;
};

//fs.writeFileSync("out", ary.join("\n")) ;