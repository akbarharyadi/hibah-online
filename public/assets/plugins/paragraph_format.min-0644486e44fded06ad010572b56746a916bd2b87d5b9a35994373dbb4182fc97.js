/*!
 * froala_editor v2.8.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2018 Froala Labs
 */


!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):"object"==typeof module&&module.exports?module.exports=function(a,e){return e===undefined&&(e="undefined"!=typeof window?require("jquery"):require("jquery")(a)),t(e)}:t(window.jQuery)}(function(g){g.extend(g.FE.DEFAULTS,{paragraphFormat:{N:"Normal",H1:"Heading 1",H2:"Heading 2",H3:"Heading 3",H4:"Heading 4",PRE:"Code"},paragraphFormatSelection:!1,paragraphDefaultSelection:"Paragraph Format"}),g.FE.PLUGINS.paragraphFormat=function(h){function f(a,e){var t=h.html.defaultTag();if(e&&e.toLowerCase()!=t)if(0<a.find("ul, ol").length){var r=g("<"+e+">");a.prepend(r);for(var n=h.node.contents(a.get(0))[0];n&&["UL","OL"].indexOf(n.tagName)<0;){var o=n.nextSibling;r.append(n),n=o}}else a.html("<"+e+">"+a.html()+"</"+e+">")}return{apply:function(a){"N"==a&&(a=h.html.defaultTag()),h.selection.save(),h.html.wrap(!0,!0,!h.opts.paragraphFormat.BLOCKQUOTE,!0,!0),h.selection.restore();var e,t,r,n,o,i,p,l,s=h.selection.blocks();h.selection.save(),h.$el.find("pre").attr("skip",!0);for(var d=0;d<s.length;d++)if(s[d].tagName!=a&&!h.node.isList(s[d])){var m=g(s[d]);"LI"==s[d].tagName?f(m,a):"LI"==s[d].parentNode.tagName&&s[d]?(i=m,p=a,l=h.html.defaultTag(),p&&p.toLowerCase()!=l||(p='div class="fr-temp-div"'),i.replaceWith(g("<"+p+">").html(i.html()))):0<=["TD","TH"].indexOf(s[d].parentNode.tagName)?(r=m,n=a,o=h.html.defaultTag(),n||(n='div class="fr-temp-div"'+(h.node.isEmpty(r.get(0),!0)?' data-empty="true"':"")),n.toLowerCase()==o?(h.node.isEmpty(r.get(0),!0)||r.append("<br/>"),r.replaceWith(r.html())):r.replaceWith(g("<"+n+">").html(r.html()))):(e=m,(t=a)||(t='div class="fr-temp-div"'+(h.node.isEmpty(e.get(0),!0)?' data-empty="true"':"")),e.replaceWith(g("<"+t+" "+h.node.attributes(e.get(0))+">").html(e.html()).removeAttr("data-empty")))}h.$el.find('pre:not([skip="true"]) + pre:not([skip="true"])').each(function(){g(this).prev().append("<br>"+g(this).html()),g(this).remove()}),h.$el.find("pre").removeAttr("skip"),h.html.unwrap(),h.selection.restore()},refreshOnShow:function(a,e){var t=h.selection.blocks();if(t.length){var r=t[0],n="N",o=h.html.defaultTag();r.tagName.toLowerCase()!=o&&r!=h.el&&(n=r.tagName),e.find('.fr-command[data-param1="'+n+'"]').addClass("fr-active").attr("aria-selected",!0)}else e.find('.fr-command[data-param1="N"]').addClass("fr-active").attr("aria-selected",!0)},refresh:function(a){if(h.opts.paragraphFormatSelection){var e=h.selection.blocks();if(e.length){var t=e[0],r="N",n=h.html.defaultTag();t.tagName.toLowerCase()!=n&&t!=h.el&&(r=t.tagName),0<=["LI","TD","TH"].indexOf(r)&&(r="N"),a.find("> span").text(h.language.translate(h.opts.paragraphFormat[r]))}else a.find("> span").text(h.language.translate(h.opts.paragraphFormat.N))}}}},g.FE.RegisterCommand("paragraphFormat",{type:"dropdown",displaySelection:function(a){return a.opts.paragraphFormatSelection},defaultSelection:function(a){return a.language.translate(a.opts.paragraphDefaultSelection)},displaySelectionWidth:125,html:function(){var a='<ul class="fr-dropdown-list" role="presentation">',e=this.opts.paragraphFormat;for(var t in e)if(e.hasOwnProperty(t)){var r=this.shortcuts.get("paragraphFormat."+t);r=r?'<span class="fr-shortcut">'+r+"</span>":"",a+='<li role="presentation"><'+("N"==t?this.html.defaultTag()||"DIV":t)+' style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="paragraphFormat" data-param1="'+t+'" title="'+this.language.translate(e[t])+'">'+this.language.translate(e[t])+"</a></"+("N"==t?this.html.defaultTag()||"DIV":t)+"></li>"}return a+="</ul>"},title:"Paragraph Format",callback:function(a,e){this.paragraphFormat.apply(e)},refresh:function(a){this.paragraphFormat.refresh(a)},refreshOnShow:function(a,e){this.paragraphFormat.refreshOnShow(a,e)},plugin:"paragraphFormat"}),g.FE.DefineIcon("paragraphFormat",{NAME:"paragraph"})});
