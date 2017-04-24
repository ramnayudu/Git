/*
Simple Image Trail script- By JavaScriptKit.com
Visit http://www.javascriptkit.com for this script and more
This notice must stay intact
*/

var offsetfrommouse=[15,15]; //image x,y offsets from cursor position in pixels. Enter 0,0 for no offset
var displayduration=0; //duration in seconds image should remain visible. 0 for always.
var currentimageheight = 270;	// maximum image size.

if (document.getElementById || document.all){
	document.write('<div id="trailimageid">');
	document.write('</div>');
}

function gettrailobj(){
if (document.getElementById)
return document.getElementById("trailimageid").style
else if (document.all)
return document.all.trailimagid.style   
}

function gettrailobjnostyle(){
if (document.getElementById)
return document.getElementById("trailimageid")
else if (document.all)
return document.all.trailimagid
}


function truebody(){
return (!window.opera && document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function showtrail(imagename,showthumb)
{
//alert('hi');
	document.onmousemove=followmouse;//1	
	
    newHTML = '<div style="padding: 5px; width:150px; background-color: Snow; border: 1px solid #888;">';	
    
	if (showthumb > 0){
		newHTML = newHTML + '<div align="center" style="padding: 8px 2px 2px 2px;">';
		//style="position:absolute; left:1px; bottom:0px;">';
		//
		newHTML = newHTML + '<img src="' + imagename + '" width="150" >';
		//newHTML = newHTML + '<img src="' + imagename + '" border="2",height="50",width="50"">';
		//newHTML = newHTML + '<h3 align="center">' + title + '</h2>';
	    //newHTML = newHTML + '<h3 align="center">'+ Age + '</h2>';
	    //newHTML = newHTML +'<h3 align="center">'+Religion +'</h2> </div>';		
	}  

	newHTML = newHTML + '</div>';
	gettrailobjnostyle().innerHTML = newHTML;//2
	gettrailobj().display="inline";//3
	
	
}



function hidetrail(){
	gettrailobj().innerHTML = " ";
	gettrailobj().display="none"
	document.onmousemove=""
	gettrailobj().left="-500px"

}

function followmouse(e){

	var xcoord=offsetfrommouse[0]
	var ycoord=offsetfrommouse[1]

	var docwidth=document.all? truebody().scrollLeft+truebody().clientWidth : pageXOffset+window.innerWidth-15
	var docheight=document.all? Math.min(truebody().scrollHeight, truebody().clientHeight) : Math.min(window.innerHeight)
	
//	var docwidth=50;
//	var docheight=50;


	if (typeof e != "undefined"){
		if (docwidth - e.pageX < 380){
			xcoord += e.pageX;//xcoord = e.pageX - xcoord - 400; // Move to the left side of the cursor
		} else {
			xcoord += e.pageX;
		}
		if (docheight - e.pageY < (currentimageheight + 110)){
			ycoord += e.pageY;//ycoord += e.pageY - Math.max(0,(110 + currentimageheight + e.pageY - docheight - truebody().scrollTop));
		} else {
			ycoord += e.pageY;
		}

	} else if (typeof window.event != "undefined"){
		if (docwidth - event.clientX < 380){
			xcoord = event.clientX + truebody().scrollLeft - xcoord - 400; // Move to the left side of the cursor
		} else {
			xcoord += truebody().scrollLeft+event.clientX
		}
		if (docheight - event.clientY < (currentimageheight + 110)){
			ycoord += event.clientY + truebody().scrollTop - Math.max(0,(110 + currentimageheight + event.clientY - docheight));
		} else {
			ycoord += truebody().scrollTop + event.clientY;
		}
	}

	if(ycoord < 0) { ycoord = ycoord*-1; }
	gettrailobj().left=xcoord+"px"
	gettrailobj().top=ycoord+"px"
//	gettrailobj().left=10+"px"
//	gettrailobj().top=10+"px"
}


