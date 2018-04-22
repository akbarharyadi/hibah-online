/*!
 * froala_editor v2.8.0 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms/
 * Copyright 2014-2018 Froala Labs
 */


!function(o){"function"==typeof define&&define.amd?define(["jquery"],o):"object"==typeof module&&module.exports?module.exports=function(t,e){return e===undefined&&(e="undefined"!=typeof window?require("jquery"):require("jquery")(t)),o(e)}:o(window.jQuery)}(function(l){l.extend(l.FE.POPUP_TEMPLATES,{"forms.edit":"[_BUTTONS_]","forms.update":"[_BUTTONS_][_TEXT_LAYER_]"}),l.extend(l.FE.DEFAULTS,{formEditButtons:["inputStyle","inputEdit"],formStyles:{"fr-rounded":"Rounded","fr-large":"Large"},formMultipleStyles:!0,formUpdateButtons:["inputBack","|"]}),l.FE.PLUGINS.forms=function(s){var r;function t(t){t.preventDefault(),s.selection.clear(),l(this).data("mousedown",!0)}function e(t){l(this).data("mousedown")&&(t.stopPropagation(),l(this).removeData("mousedown"),a(r=this)),t.preventDefault()}function o(){s.$el.find("input, textarea, button").removeData("mousedown")}function n(){l(this).removeData("mousedown")}function i(){return r||null}function a(t){var e=s.popups.get("forms.edit");e||(e=function(){var t="";0<s.opts.formEditButtons.length&&(t='<div class="fr-buttons">'+s.button.buildList(s.opts.formEditButtons)+"</div>");var e={buttons:t},o=s.popups.create("forms.edit",e);return s.$wp&&s.events.$on(s.$wp,"scroll.link-edit",function(){i()&&s.popups.isVisible("forms.edit")&&a(i())}),o}());var o=l(r=t);s.popups.refresh("forms.edit"),s.popups.setContainer("forms.edit",s.$sc);var n=o.offset().left+o.outerWidth()/2,u=o.offset().top+o.outerHeight();s.popups.show("forms.edit",n,u,o.outerHeight())}function p(){var t=s.popups.get("forms.update"),e=i();if(e){var o=l(e);o.is("button")?t.find('input[type="text"][name="text"]').val(o.text()):t.find('input[type="text"][name="text"]').val(o.attr("placeholder"))}t.find('input[type="text"][name="text"]').trigger("change")}function f(){r=null}function d(t){if(t)return s.popups.onRefresh("forms.update",p),s.popups.onHide("forms.update",f),!0;var e="";1<=s.opts.formUpdateButtons.length&&(e='<div class="fr-buttons">'+s.button.buildList(s.opts.formUpdateButtons)+"</div>");var o="",n=0;o='<div class="fr-forms-text-layer fr-layer fr-active">',o+='<div class="fr-input-line"><input name="text" type="text" placeholder="Text" tabIndex="'+ ++n+'"></div>';var u={buttons:e,text_layer:o+='<div class="fr-action-buttons"><button class="fr-command fr-submit" data-cmd="updateInput" href="#" tabIndex="'+ ++n+'" type="button">'+s.language.translate("Update")+"</button></div></div>"};return s.popups.create("forms.update",u)}return{_init:function(){s.events.$on(s.$el,s._mousedown,"input, textarea, button",t),s.events.$on(s.$el,s._mouseup,"input, textarea, button",e),s.events.$on(s.$el,"touchmove","input, textarea, button",n),s.events.$on(s.$el,s._mouseup,o),s.events.$on(s.$win,s._mouseup,o),d(!0),s.events.$on(s.$el,"submit","form",function(t){return t.preventDefault(),!1})},updateInput:function(){var t=s.popups.get("forms.update"),e=i();if(e){var o=l(e),n=t.find('input[type="text"][name="text"]').val()||"";n.length&&(o.is("button")?o.text(n):o.attr("placeholder",n)),s.popups.hide("forms.update"),a(e)}},getInput:i,applyStyle:function(t,e,o){void 0===e&&(e=s.opts.formStyles),void 0===o&&(o=s.opts.formMultipleStyles);var n=i();if(!n)return!1;if(!o){var u=Object.keys(e);u.splice(u.indexOf(t),1),l(n).removeClass(u.join(" "))}l(n).toggleClass(t)},showUpdatePopup:function(){var t=i();if(t){var e=l(t),o=s.popups.get("forms.update");o||(o=d()),s.popups.isVisible("forms.update")||s.popups.refresh("forms.update"),s.popups.setContainer("forms.update",s.$sc);var n=e.offset().left+e.outerWidth()/2,u=e.offset().top+e.outerHeight();s.popups.show("forms.update",n,u,e.outerHeight())}},showEditPopup:a,back:function(){s.events.disableBlur(),s.selection.restore(),s.events.enableBlur();var t=i();t&&s.$wp&&("BUTTON"==t.tagName&&s.selection.restore(),a(t))}}},l.FE.RegisterCommand("updateInput",{undo:!1,focus:!1,title:"Update",callback:function(){this.forms.updateInput()}}),l.FE.DefineIcon("inputStyle",{NAME:"magic"}),l.FE.RegisterCommand("inputStyle",{title:"Style",type:"dropdown",html:function(){var t='<ul class="fr-dropdown-list">',e=this.opts.formStyles;for(var o in e)e.hasOwnProperty(o)&&(t+='<li><a class="fr-command" tabIndex="-1" data-cmd="inputStyle" data-param1="'+o+'">'+this.language.translate(e[o])+"</a></li>");return t+="</ul>"},callback:function(t,e){var o=this.forms.getInput();o&&(this.forms.applyStyle(e),this.forms.showEditPopup(o))},refreshOnShow:function(t,e){var o=this.forms.getInput();if(o){var n=l(o);e.find(".fr-command").each(function(){var t=l(this).data("param1");l(this).toggleClass("fr-active",n.hasClass(t))})}}}),l.FE.DefineIcon("inputEdit",{NAME:"edit"}),l.FE.RegisterCommand("inputEdit",{title:"Edit Button",undo:!1,refreshAfterCallback:!1,callback:function(){this.forms.showUpdatePopup()}}),l.FE.DefineIcon("inputBack",{NAME:"arrow-left"}),l.FE.RegisterCommand("inputBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.forms.back()}}),l.FE.RegisterCommand("updateInput",{undo:!1,focus:!1,title:"Update",callback:function(){this.forms.updateInput()}})});
