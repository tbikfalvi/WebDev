/*
	Air-Box v0.9.5 - Let your breathe your images! 
	(c) 2008 Riccardo Budini  <http://www.provisum-illumina.com>
	MIT-style license.
*/

/*
	Air-Box resizer
*/


window.addEvent('domready', function(){
	airrez();
});



function start() { 
	  airrez(); 
	  init_qr(); 
	} 
	 
	window.onload = start; 

function airrez()
{
   if (document.getElementsByName)
   {
      for (i=0; i<document.getElementsByTagName('img').length; i++) 
      {
         pic = document.getElementsByTagName('img')[i];
		 
	     if (pic.className == "postimage") 
		 {
         if (pic.width > 660)
         	{
            pic.setAttribute('width','660')

            
            if (document.all) pic.style.cursor = 'hand';
            if (!document.all) pic.style.cursor = 'pointer';
            pic.title = 'Click Here To See Image Full Size ';
         	}
       }
	 }
   }
}



/*
	Slimbox v1.51 - The ultimate lightweight Lightbox clone
	(c) 2007-2008 Christophe Beyls <http://www.digitalia.be>
	MIT-style license.
*/
var Slimbox;(function(){var G={},H=0,F,M,B,P,a,E,N,K=new Image(),L=new Image(),W,Z,Q,I,V,Y,J,X,C;window.addEvent("domready",function(){a=U.bindWithEvent();$(document.body).adopt($$([W=new Element("div",{id:"lbOverlay"}),Z=new Element("div",{id:"lbCenter"}),Y=new Element("div",{id:"lbBottomContainer"})]).setStyle("display","none"));Q=new Element("div",{id:"lbImage"}).injectInside(Z).adopt(I=new Element("a",{id:"lbPrevLink",href:"#"}),V=new Element("a",{id:"lbNextLink",href:"#"}));I.onclick=D;V.onclick=S;var c;J=new Element("div",{id:"lbBottom"}).injectInside(Y).adopt(c=new Element("a",{id:"lbCloseLink",href:"#"}),X=new Element("div",{id:"lbCaption"}),C=new Element("div",{id:"lbNumber"}),new Element("div",{styles:{clear:"both"}}));c.onclick=W.onclick=O;E={overlay:W.effect("opacity",{duration:500}).set(0),image:Q.effect("opacity",{duration:500,onComplete:A}),bottom:J.effect("margin-top",{duration:400})}});Slimbox={open:function(e,d,c){F=$extend({overlayOpacity:0.8,resizeDuration:400,resizeTransition:false,initialWidth:250,initialHeight:250,animateCaption:true,showCounter:true,counterText:"Image {x} of {y}"},c||{});if(typeof e=="string"){e=[[e,d]];d=0}M=e;b();R(true);P=window.getScrollTop()+(window.getHeight()/15);E.resize=Z.effects($extend({duration:F.resizeDuration,onComplete:A},F.resizeTransition?{transition:F.resizeTransition}:{}));Z.setStyles({top:P,width:F.initialWidth,height:F.initialHeight,marginLeft:-(F.initialWidth/2),display:""});E.overlay.start(F.overlayOpacity);return T(d)}};Element.extend({slimbox:function(c,d){$$(this).slimbox(c,d)}});Elements.extend({slimbox:function(c,f,e){f=f||function(g){return[g.href,g.title]};e=e||function(){return true};var d=this;d.forEach(function(g){g.onclick=function(){var h=d.filter(e,this);return Slimbox.open(h.map(f),h.indexOf(this),c)}})}});function b(){W.setStyles({top:window.getScrollTop(),height:window.getHeight()})}function R(c){["object",window.ie?"select":"embed"].forEach(function(e){$each(document.getElementsByTagName(e),function(f){if(c){G[f]=f.style.visibility}f.style.visibility=c?"hidden":G[f]})});W.style.display=c?"":"none";var d=c?"addEvent":"removeEvent";window[d]("scroll",b)[d]("resize",b);document[d]("keydown",a)}function U(c){switch(c.code){case 27:case 88:case 67:O();break;case 37:case 80:D();break;case 39:case 78:S()}c.preventDefault()}function D(){return T(B-1)}function S(){return T(B+1)}function T(c){if((H>1)||(c<0)||(c>=M.length)){return false}H=2;B=c;$$(I,V,Q,Y).setStyle("display","none");E.bottom.stop().set(0);E.image.set(0);Z.className="lbLoading";N=new Image();N.onload=A;N.src=M[c][0];return false}function A(){switch(H++){case 2:Z.className="";Q.setStyles({backgroundImage:"url("+M[B][0]+")",display:""});$$(Q,J).setStyle("width",N.width);$$(Q,I,V).setStyle("height",N.height);X.setHTML(M[B][1]||"");C.setHTML((F.showCounter&&(M.length>1))?F.counterText.replace(/{x}/,B+1).replace(/{y}/,M.length):"");if(B){K.src=M[B-1][0]}if(B!=(M.length-1)){L.src=M[B+1][0]}if(Z.clientHeight!=Q.offsetHeight){E.resize.start({height:Q.offsetHeight});break}H++;case 3:if(Z.clientWidth!=Q.offsetWidth){E.resize.start({width:Q.offsetWidth,marginLeft:-Q.offsetWidth/2});break}H++;case 4:Y.setStyles({top:P+Z.clientHeight,height:0,marginLeft:Z.style.marginLeft,display:""});E.image.start(1);break;case 5:if(B){I.style.display=""}if(B<(M.length-1)){V.style.display=""}if(F.animateCaption){E.bottom.set(-J.offsetHeight).start(0)}Y.style.height="";H=1}}function O(){if(!H){return false}H=0;N.onload=Class.empty;for(var c in E){E[c].stop()}$$(Z,Y).setStyle("display","none");E.overlay.chain(R).start(0);return false}})();

// AUTOLOAD CODE BLOCK (MAY BE CHANGED OR REMOVED)
Slimbox.scanPage = function() {
	var links = $$("a").filter(function(el) {
		return el.rel && el.rel.test(/^lightbox/i);
	});
	// PUT YOUR CUSTOM OPTIONS INSIDE THE FOLLOWING {}
	$$(links).slimbox({}, null, function(el) {
		return (this == el) || ((this.rel.length > 8) && (this.rel == el.rel));
	});
};
window.addEvent("domready", Slimbox.scanPage);


