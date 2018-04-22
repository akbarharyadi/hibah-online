/*!
 * froala_editor v2.8.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2018 Froala Labs
 */


!function(n){"function"==typeof define&&define.amd?define(["jquery"],n):"object"==typeof module&&module.exports?module.exports=function(e,t){return t===undefined&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(e)),n(t)}:n(window.jQuery)}(function(m){m.extend(m.FE.POPUP_TEMPLATES,{"link.edit":"[_BUTTONS_]","link.insert":"[_BUTTONS_][_INPUT_LAYER_]"}),m.extend(m.FE.DEFAULTS,{linkEditButtons:["linkOpen","linkStyle","linkEdit","linkRemove"],linkInsertButtons:["linkBack","|","linkList"],linkAttributes:{},linkAutoPrefix:"http://",linkStyles:{"fr-green":"Green","fr-strong":"Thick"},linkMultipleStyles:!0,linkConvertEmailAddress:!0,linkAlwaysBlank:!1,linkAlwaysNoFollow:!1,linkNoOpener:!0,linkNoReferrer:!0,linkList:[{text:"Froala",href:"https://froala.com",target:"_blank"},{text:"Google",href:"https://google.com",target:"_blank"},{displayText:"Facebook",href:"https://facebook.com"}],linkText:!0}),m.FE.PLUGINS.link=function(d){function c(){var e=d.image?d.image.get():null;if(!e&&d.$wp){var t=d.selection.ranges(0).commonAncestorContainer;try{t&&(t.contains&&t.contains(d.el)||!d.el.contains(t)||d.el==t)&&(t=null)}catch(r){t=null}if(t&&"A"===t.tagName)return t;var n=d.selection.element(),i=d.selection.endElement();"A"==n.tagName||d.node.isElement(n)||(n=m(n).parentsUntil(d.$el,"a:first").get(0)),"A"==i.tagName||d.node.isElement(i)||(i=m(i).parentsUntil(d.$el,"a:first").get(0));try{i&&(i.contains&&i.contains(d.el)||!d.el.contains(i)||d.el==i)&&(i=null)}catch(r){i=null}try{n&&(n.contains&&n.contains(d.el)||!d.el.contains(n)||d.el==n)&&(n=null)}catch(r){n=null}return i&&i==n&&"A"==i.tagName?(d.browser.msie||d.helpers.isMobile())&&(d.selection.info(n).atEnd||d.selection.info(n).atStart)?null:n:null}return"A"==d.el.tagName?d.el:e&&e.get(0).parentNode&&"A"==e.get(0).parentNode.tagName?e.get(0).parentNode:void 0}function u(){var e,t,n,i,r=d.image?d.image.get():null,l=[];if(r)"A"==r.get(0).parentNode.tagName&&l.push(r.get(0).parentNode);else if(d.win.getSelection){var a=d.win.getSelection();if(a.getRangeAt&&a.rangeCount){i=d.doc.createRange();for(var s=0;s<a.rangeCount;++s)if((t=(e=a.getRangeAt(s)).commonAncestorContainer)&&1!=t.nodeType&&(t=t.parentNode),t&&"a"==t.nodeName.toLowerCase())l.push(t);else{n=t.getElementsByTagName("a");for(var o=0;o<n.length;++o)i.selectNodeContents(n[o]),i.compareBoundaryPoints(e.END_TO_START,e)<1&&-1<i.compareBoundaryPoints(e.START_TO_END,e)&&l.push(n[o])}}}else if(d.doc.selection&&"Control"!=d.doc.selection.type)if("a"==(t=(e=d.doc.selection.createRange()).parentElement()).nodeName.toLowerCase())l.push(t);else{n=t.getElementsByTagName("a"),i=d.doc.body.createTextRange();for(var p=0;p<n.length;++p)i.moveToElementText(n[p]),-1<i.compareEndPoints("StartToEnd",e)&&i.compareEndPoints("EndToStart",e)<1&&l.push(n[p])}return l}function k(r){if(d.core.hasFocus()){if(a(),r&&"keyup"===r.type&&(r.altKey||r.which==m.FE.KEYCODE.ALT))return!0;setTimeout(function(){if(!r||r&&(1==r.which||"mouseup"!=r.type)){var e=c(),t=d.image?d.image.get():null;if(e&&!t){if(d.image){var n=d.node.contents(e);if(1==n.length&&"IMG"==n[0].tagName){var i=d.selection.ranges(0);return 0===i.startOffset&&0===i.endOffset?m(e).before(m.FE.MARKERS):m(e).after(m.FE.MARKERS),d.selection.restore(),!1}}r&&r.stopPropagation(),l(e)}}},d.helpers.isIOS()?100:0)}}function l(e){var t=d.popups.get("link.edit");t||(t=function(){var e="";1<=d.opts.linkEditButtons.length&&("A"==d.el.tagName&&0<=d.opts.linkEditButtons.indexOf("linkRemove")&&d.opts.linkEditButtons.splice(d.opts.linkEditButtons.indexOf("linkRemove"),1),e='<div class="fr-buttons">'+d.button.buildList(d.opts.linkEditButtons)+"</div>");var t={buttons:e},n=d.popups.create("link.edit",t);d.$wp&&d.events.$on(d.$wp,"scroll.link-edit",function(){c()&&d.popups.isVisible("link.edit")&&l(c())});return n}());var n=m(e);d.popups.isVisible("link.edit")||d.popups.refresh("link.edit"),d.popups.setContainer("link.edit",d.$sc);var i=n.offset().left+m(e).outerWidth()/2,r=n.offset().top+n.outerHeight();d.popups.show("link.edit",i,r,n.outerHeight())}function a(){d.popups.hide("link.edit")}function o(){}function p(){var e=d.popups.get("link.insert"),t=c();if(t){var n,i,r=m(t),l=e.find('input.fr-link-attr[type="text"]'),a=e.find('input.fr-link-attr[type="checkbox"]');for(n=0;n<l.length;n++)(i=m(l[n])).val(r.attr(i.attr("name")||""));for(a.prop("checked",!1),n=0;n<a.length;n++)i=m(a[n]),r.attr(i.attr("name"))==i.data("checked")&&i.prop("checked",!0);e.find('input.fr-link-attr[type="text"][name="text"]').val(r.text())}else e.find('input.fr-link-attr[type="text"]').val(""),e.find('input.fr-link-attr[type="checkbox"]').prop("checked",!1),e.find('input.fr-link-attr[type="text"][name="text"]').val(d.selection.text());e.find("input.fr-link-attr").trigger("change"),(d.image?d.image.get():null)?e.find('.fr-link-attr[name="text"]').parent().hide():e.find('.fr-link-attr[name="text"]').parent().show()}function s(e){if(e)return d.popups.onRefresh("link.insert",p),d.popups.onHide("link.insert",o),!0;var t="";1<=d.opts.linkInsertButtons.length&&(t='<div class="fr-buttons">'+d.button.buildList(d.opts.linkInsertButtons)+"</div>");var n="",i=0;for(var r in n='<div class="fr-link-insert-layer fr-layer fr-active" id="fr-link-insert-layer-'+d.id+'">',n+='<div class="fr-input-line"><input id="fr-link-insert-layer-url-'+d.id+'" name="href" type="text" class="fr-link-attr" placeholder="'+d.language.translate("URL")+'" tabIndex="'+ ++i+'"></div>',d.opts.linkText&&(n+='<div class="fr-input-line"><input id="fr-link-insert-layer-text-'+d.id+'" name="text" type="text" class="fr-link-attr" placeholder="'+d.language.translate("Text")+'" tabIndex="'+ ++i+'"></div>'),d.opts.linkAttributes)if(d.opts.linkAttributes.hasOwnProperty(r)){var l=d.opts.linkAttributes[r];n+='<div class="fr-input-line"><input name="'+r+'" type="text" class="fr-link-attr" placeholder="'+d.language.translate(l)+'" tabIndex="'+ ++i+'"></div>'}d.opts.linkAlwaysBlank||(n+='<div class="fr-checkbox-line"><span class="fr-checkbox"><input name="target" class="fr-link-attr" data-checked="_blank" type="checkbox" id="fr-link-target-'+d.id+'" tabIndex="'+ ++i+'"><span><svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="10" height="10" viewBox="0 0 32 32"><path d="M27 4l-15 15-7-7-5 5 12 12 20-20z" fill="#FFF"></path></svg></span></span><label for="fr-link-target-'+d.id+'">'+d.language.translate("Open in new tab")+"</label></div>");var a={buttons:t,input_layer:n+='<div class="fr-action-buttons"><button class="fr-command fr-submit" role="button" data-cmd="linkInsert" href="#" tabIndex="'+ ++i+'" type="button">'+d.language.translate("Insert")+"</button></div></div>"},s=d.popups.create("link.insert",a);return d.$wp&&d.events.$on(d.$wp,"scroll.link-insert",function(){(d.image?d.image.get():null)&&d.popups.isVisible("link.insert")&&h(),d.popups.isVisible("link.insert")&&g()}),s}function f(e,t,n){if(void 0===n&&(n={}),!1===d.events.trigger("link.beforeInsert",[e,t,n]))return!1;var i=d.image?d.image.get():null;i||"A"==d.el.tagName?"A"==d.el.tagName&&d.$el.focus():(d.selection.restore(),d.popups.hide("link.insert"));var r=e;d.opts.linkConvertEmailAddress&&d.helpers.isEmail(e)&&!/^mailto:.*/i.test(e)&&(e="mailto:"+e);if(""===d.opts.linkAutoPrefix||new RegExp("^("+m.FE.LinkProtocols.join("|")+"):.","i").test(e)||/^data:image.*/i.test(e)||/^(https?:|ftps?:|file:|)\/\//i.test(e)||/^([A-Za-z]:(\\){1,2}|[A-Za-z]:((\\){1,2}[^\\]+)+)(\\)?$/i.test(e)||["/","{","[","#","(","."].indexOf((e||"")[0])<0&&(e=d.opts.linkAutoPrefix+d.helpers.sanitizeURL(e)),e=d.helpers.sanitizeURL(e),d.opts.linkAlwaysBlank&&(n.target="_blank"),d.opts.linkAlwaysNoFollow&&(n.rel="nofollow"),"_blank"==n.target?(d.opts.linkNoOpener&&(n.rel?n.rel+=" noopener":n.rel="noopener"),d.opts.linkNoReferrer&&(n.rel?n.rel+=" noreferrer":n.rel="noreferrer")):null==n.target&&(n.rel?n.rel=n.rel.replace(/noopener/,"").replace(/noreferrer/,""):n.rel=null),t=t||"",e===d.opts.linkAutoPrefix)return d.popups.get("link.insert").find('input[name="href"]').addClass("fr-error"),d.events.trigger("link.bad",[r]),!1;var l,a=c();if(a){if((l=m(a)).attr("href",e),0<t.length&&l.text()!=t&&!i){for(var s=l.get(0);1===s.childNodes.length&&s.childNodes[0].nodeType==Node.ELEMENT_NODE;)s=s.childNodes[0];m(s).text(t)}i||l.prepend(m.FE.START_MARKER).append(m.FE.END_MARKER),l.attr(n),i||d.selection.restore()}else{i?i.wrap('<a href="'+e+'"></a>'):(d.format.remove("a"),d.selection.isCollapsed()?(t=0===t.length?r:t,d.html.insert('<a href="'+e+'">'+m.FE.START_MARKER+t.replace(/&/g,"&amp;")+m.FE.END_MARKER+"</a>"),d.selection.restore()):0<t.length&&t!=d.selection.text().replace(/\n/g,"")?(d.selection.remove(),d.html.insert('<a href="'+e+'">'+m.FE.START_MARKER+t.replace(/&/g,"&amp;")+m.FE.END_MARKER+"</a>"),d.selection.restore()):(!function(){if(!d.selection.isCollapsed()){d.selection.save();for(var e=d.$el.find(".fr-marker").addClass("fr-unprocessed").toArray();e.length;){var t=m(e.pop());t.removeClass("fr-unprocessed");var n=d.node.deepestParent(t.get(0));if(n){for(var i=t.get(0),r="",l="";i=i.parentNode,d.node.isBlock(i)||(r+=d.node.closeTagString(i),l=d.node.openTagString(i)+l),i!=n;);var a=d.node.openTagString(t.get(0))+t.html()+d.node.closeTagString(t.get(0));t.replaceWith('<span id="fr-break"></span>');var s=n.outerHTML;s=s.replace(/<span id="fr-break"><\/span>/g,r+a+l),n.outerHTML=s}e=d.$el.find(".fr-marker.fr-unprocessed").toArray()}d.html.cleanEmptyTags(),d.selection.restore()}}(),d.format.apply("a",{href:e})));for(var o=u(),p=0;p<o.length;p++)(l=m(o[p])).attr(n),l.removeAttr("_moz_dirty");1==o.length&&d.$wp&&!i&&(m(o[0]).prepend(m.FE.START_MARKER).append(m.FE.END_MARKER),d.selection.restore())}if(i){var f=d.popups.get("link.insert");f&&f.find("input:focus").blur(),d.image.edit(i)}else k()}function g(){a();var e=c();if(e){var t=d.popups.get("link.insert");t||(t=s()),d.popups.isVisible("link.insert")||(d.popups.refresh("link.insert"),d.selection.save(),d.helpers.isMobile()&&(d.events.disableBlur(),d.$el.blur(),d.events.enableBlur())),d.popups.setContainer("link.insert",d.$sc);var n=(d.image?d.image.get():null)||m(e),i=n.offset().left+n.outerWidth()/2,r=n.offset().top+n.outerHeight();d.popups.show("link.insert",i,r,n.outerHeight())}}function h(){var e=d.image?d.image.getEl():null;if(e){var t=d.popups.get("link.insert");d.image.hasCaption()&&(e=e.find(".fr-img-wrap")),t||(t=s()),p(),d.popups.setContainer("link.insert",d.$sc);var n=e.offset().left+e.outerWidth()/2,i=e.offset().top+e.outerHeight();d.popups.show("link.insert",n,i,e.outerHeight())}}return{_init:function(){d.events.on("keyup",function(e){e.which!=m.FE.KEYCODE.ESC&&k(e)}),d.events.on("window.mouseup",k),d.events.$on(d.$el,"click","a",function(e){d.edit.isDisabled()&&e.preventDefault()}),d.helpers.isMobile()&&d.events.$on(d.$doc,"selectionchange",k),s(!0),"A"==d.el.tagName&&d.$el.addClass("fr-view"),d.events.on("toolbar.esc",function(){if(d.popups.isVisible("link.edit"))return d.events.disableBlur(),d.events.focus(),!1},!0)},remove:function(){var e=c(),t=d.image?d.image.get():null;if(!1===d.events.trigger("link.beforeRemove",[e]))return!1;t&&e?(t.unwrap(),d.image.edit(t)):e&&(d.selection.save(),m(e).replaceWith(m(e).html()),d.selection.restore(),a())},showInsertPopup:function(){var e=d.$tb.find('.fr-command[data-cmd="insertLink"]'),t=d.popups.get("link.insert");if(t||(t=s()),!t.hasClass("fr-active"))if(d.popups.refresh("link.insert"),d.popups.setContainer("link.insert",d.$tb||d.$sc),e.is(":visible")){var n=e.offset().left+e.outerWidth()/2,i=e.offset().top+(d.opts.toolbarBottom?10:e.outerHeight()-10);d.popups.show("link.insert",n,i,e.outerHeight())}else d.position.forSelection(t),d.popups.show("link.insert")},usePredefined:function(e){var t,n,i=d.opts.linkList[e],r=d.popups.get("link.insert"),l=r.find('input.fr-link-attr[type="text"]'),a=r.find('input.fr-link-attr[type="checkbox"]');for(n=0;n<l.length;n++)i[(t=m(l[n])).attr("name")]?t.val(i[t.attr("name")]):"text"!=t.attr("name")&&t.val("");for(n=0;n<a.length;n++)(t=m(a[n])).prop("checked",t.data("checked")==i[t.attr("name")]);d.accessibility.focusPopup(r)},insertCallback:function(){var e,t,n=d.popups.get("link.insert"),i=n.find('input.fr-link-attr[type="text"]'),r=n.find('input.fr-link-attr[type="checkbox"]'),l=(i.filter('[name="href"]').val()||"").trim(),a=i.filter('[name="text"]').val(),s={};for(t=0;t<i.length;t++)e=m(i[t]),["href","text"].indexOf(e.attr("name"))<0&&(s[e.attr("name")]=e.val());for(t=0;t<r.length;t++)(e=m(r[t])).is(":checked")?s[e.attr("name")]=e.data("checked"):s[e.attr("name")]=e.data("unchecked")||null;var o=d.helpers.scrollTop();f(l,a,s),m(d.o_win).scrollTop(o)},insert:f,update:g,get:c,allSelected:u,back:function(){d.image&&d.image.get()?d.image.back():(d.events.disableBlur(),d.selection.restore(),d.events.enableBlur(),c()&&d.$wp?(d.selection.restore(),a(),k()):"A"==d.el.tagName?(d.$el.focus(),k()):(d.popups.hide("link.insert"),d.toolbar.showInline()))},imageLink:h,applyStyle:function(e,t,n){void 0===n&&(n=d.opts.linkMultipleStyles),void 0===t&&(t=d.opts.linkStyles);var i=c();if(!i)return!1;if(!n){var r=Object.keys(t);r.splice(r.indexOf(e),1),m(i).removeClass(r.join(" "))}m(i).toggleClass(e),k()}}},m.FE.DefineIcon("insertLink",{NAME:"link"}),m.FE.RegisterShortcut(m.FE.KEYCODE.K,"insertLink",null,"K"),m.FE.RegisterCommand("insertLink",{title:"Insert Link",undo:!1,focus:!0,refreshOnCallback:!1,popup:!0,callback:function(){this.popups.isVisible("link.insert")?(this.$el.find(".fr-marker").length&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("link.insert")):this.link.showInsertPopup()},plugin:"link"}),m.FE.DefineIcon("linkOpen",{NAME:"external-link",FA5NAME:"external-link-alt"}),m.FE.RegisterCommand("linkOpen",{title:"Open Link",undo:!1,refresh:function(e){this.link.get()?e.removeClass("fr-hidden"):e.addClass("fr-hidden")},callback:function(){var e=this.link.get();e&&(this.o_win.open(e.href,"_blank","noopener"),this.popups.hide("link.edit"))},plugin:"link"}),m.FE.DefineIcon("linkEdit",{NAME:"edit"}),m.FE.RegisterCommand("linkEdit",{title:"Edit Link",undo:!1,refreshAfterCallback:!1,popup:!0,callback:function(){this.link.update()},refresh:function(e){this.link.get()?e.removeClass("fr-hidden"):e.addClass("fr-hidden")},plugin:"link"}),m.FE.DefineIcon("linkRemove",{NAME:"unlink"}),m.FE.RegisterCommand("linkRemove",{title:"Unlink",callback:function(){this.link.remove()},refresh:function(e){this.link.get()?e.removeClass("fr-hidden"):e.addClass("fr-hidden")},plugin:"link"}),m.FE.DefineIcon("linkBack",{NAME:"arrow-left"}),m.FE.RegisterCommand("linkBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.link.back()},refresh:function(e){var t=this.link.get()&&this.doc.hasFocus();(this.image?this.image.get():null)||t||this.opts.toolbarInline?(e.removeClass("fr-hidden"),e.next(".fr-separator").removeClass("fr-hidden")):(e.addClass("fr-hidden"),e.next(".fr-separator").addClass("fr-hidden"))},plugin:"link"}),m.FE.DefineIcon("linkList",{NAME:"search"}),m.FE.RegisterCommand("linkList",{title:"Choose Link",type:"dropdown",focus:!1,undo:!1,refreshAfterCallback:!1,html:function(){for(var e='<ul class="fr-dropdown-list" role="presentation">',t=this.opts.linkList,n=0;n<t.length;n++)e+='<li role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="linkList" data-param1="'+n+'">'+(t[n].displayText||t[n].text)+"</a></li>";return e+="</ul>"},callback:function(e,t){this.link.usePredefined(t)},plugin:"link"}),m.FE.RegisterCommand("linkInsert",{focus:!1,refreshAfterCallback:!1,callback:function(){this.link.insertCallback()},refresh:function(e){this.link.get()?e.text(this.language.translate("Update")):e.text(this.language.translate("Insert"))},plugin:"link"}),m.FE.DefineIcon("imageLink",{NAME:"link"}),m.FE.RegisterCommand("imageLink",{title:"Insert Link",undo:!1,focus:!1,popup:!0,callback:function(){this.link.imageLink()},refresh:function(e){var t;this.link.get()?((t=e.prev()).hasClass("fr-separator")&&t.removeClass("fr-hidden"),e.addClass("fr-hidden")):((t=e.prev()).hasClass("fr-separator")&&t.addClass("fr-hidden"),e.removeClass("fr-hidden"))},plugin:"link"}),m.FE.DefineIcon("linkStyle",{NAME:"magic"}),m.FE.RegisterCommand("linkStyle",{title:"Style",type:"dropdown",html:function(){var e='<ul class="fr-dropdown-list" role="presentation">',t=this.opts.linkStyles;for(var n in t)t.hasOwnProperty(n)&&(e+='<li role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="linkStyle" data-param1="'+n+'">'+this.language.translate(t[n])+"</a></li>");return e+="</ul>"},callback:function(e,t){this.link.applyStyle(t)},refreshOnShow:function(e,t){var n=this.link.get();if(n){var i=m(n);t.find(".fr-command").each(function(){var e=m(this).data("param1"),t=i.hasClass(e);m(this).toggleClass("fr-active",t).attr("aria-selected",t)})}},refresh:function(e){this.link.get()?e.removeClass("fr-hidden"):e.addClass("fr-hidden")},plugin:"link"})});
