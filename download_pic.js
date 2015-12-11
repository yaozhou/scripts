#!/bin/nodejs

var fs = require('fs') ;
var cp = require('child_process') ;

filename = "/home/yao/develop/touying/xiaoshuai/src.html" ;
var str = fs.readFileSync(filename).toString() ;
var ary = str.match(/src="[^"]+"/g) ;

for (var i = 0; i < ary.length; i++) {
	var url = ary[i].match(/http:\/\/[^"]+/g)[0] ;
	
	var cmd = "wget " + url + " -O out//" + (100+i) + ".jpg"
	console.log(cmd) ;
	cp.exec(cmd) ;
};

//fs.writeFileSync("out", ary.join("\n")) ;