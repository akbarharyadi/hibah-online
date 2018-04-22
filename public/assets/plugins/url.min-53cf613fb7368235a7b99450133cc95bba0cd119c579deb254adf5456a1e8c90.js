/*!
 * froala_editor v2.8.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2018 Froala Labs
 */


!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):"object"==typeof module&&module.exports?module.exports=function(e,n){return n===undefined&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(e)),t(n)}:t(window.jQuery)}(function(p){p.FE.URLRegEx="(^| |\\u00A0)("+p.FE.LinkRegEx+"|([a-z0-9+-_.]{1,}@[a-z0-9+-_.]{1,}\\.[a-z0-9+-_]{1,}))$",p.FE.PLUGINS.url=function(i){var l=null;function n(e,n,t){for(var r="";t.length&&"."==t[t.length-1];)r+=".",t=t.substring(0,t.length-1);var o=t;if(i.opts.linkConvertEmailAddress)i.helpers.isEmail(o)&&!/^mailto:.*/i.test(o)&&(o="mailto:"+o);else if(i.helpers.isEmail(o))return n+t;return/^((http|https|ftp|ftps|mailto|tel|sms|notes|data)\:)/i.test(o)||(o="//"+o),(n||"")+"<a"+(i.opts.linkAlwaysBlank?' target="_blank"':"")+(l?' rel="'+l+'"':"")+' data-fr-linked="true" href="'+o+'">'+t.replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/&amp;/g,"&").replace(/&/g,"&amp;")+"</a>"+r}function o(){return new RegExp(p.FE.URLRegEx,"gi")}function a(e){return i.opts.linkAlwaysNoFollow&&(l="nofollow"),i.opts.linkAlwaysBlank&&(i.opts.linkNoOpener&&(l?l+=" noopener":l="noopener"),i.opts.linkNoReferrer&&(l?l+=" noreferrer":l="noreferrer")),e.replace(o(),n)}function s(e){var n=e.split(" ");return n[n.length-1]}function t(){var n=i.selection.ranges(0).startContainer;if(!n||n.nodeType!==Node.TEXT_NODE)return!1;if(function e(n){return!!n&&("A"===n.tagName||!(!n.parentNode||n.parentNode==i.el)&&e(n.parentNode))}(n))return!1;if(o().test(s(n.textContent))){p(n).before(a(n.textContent));var t=p(n.parentNode).find("a[data-fr-linked]");t.removeAttr("data-fr-linked"),n.parentNode.removeChild(n),i.events.trigger("url.linked",[t.get(0)])}else if(n.textContent.split(" ").length<=2&&n.previousSibling&&"A"===n.previousSibling.tagName){var r=n.previousSibling.innerText+n.textContent;o().test(s(r))&&(p(n.previousSibling).replaceWith(a(r)),n.parentNode.removeChild(n))}}return{_init:function(){i.events.on("keypress",function(e){!i.selection.isCollapsed()||"."!=e.key&&")"!=e.key&&"("!=e.key||t()},!0),i.events.on("keydown",function(e){var n=e.which;!i.selection.isCollapsed()||n!=p.FE.KEYCODE.ENTER&&n!=p.FE.KEYCODE.SPACE||t()},!0),i.events.on("paste.beforeCleanup",function(e){if(i.helpers.isURL(e)){var n=null;return i.opts.linkAlwaysBlank&&(i.opts.linkNoOpener&&(n?n+=" noopener":n="noopener"),i.opts.linkNoReferrer&&(n?n+=" noreferrer":n="noreferrer")),"<a"+(i.opts.linkAlwaysBlank?' target="_blank"':"")+(n?' rel="'+n+'"':"")+' href="'+e+'" >'+e+"</a>"}})}}}});
