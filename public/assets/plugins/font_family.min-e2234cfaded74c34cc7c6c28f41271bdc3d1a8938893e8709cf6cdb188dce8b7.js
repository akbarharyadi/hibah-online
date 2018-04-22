!function(n){"function"==typeof define&&define.amd?define(["jquery"],n):"object"==typeof module&&module.exports?module.exports=function(e,t){return t===undefined&&(t="undefined"!=typeof window?require("jquery"):require("jquery")(e)),n(t)}:n(window.jQuery)}(function(l){l.extend(l.FE.DEFAULTS,{fontFamily:{"Arial,Helvetica,sans-serif":"Arial","Georgia,serif":"Georgia","Impact,Charcoal,sans-serif":"Impact","Tahoma,Geneva,sans-serif":"Tahoma","Times New Roman,Times,serif,-webkit-standard":"Times New Roman","Verdana,Geneva,sans-serif":"Verdana"},fontFamilySelection:!1,fontFamilyDefaultSelection:"Font Family"}),l.FE.PLUGINS.fontFamily=function(o){function i(e){var t=e.replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'| /g,"").split(",");return l.grep(t,function(e){return 0<e.length})}function r(e,t){for(var n=0;n<e.length;n++)for(var a=0;a<t.length;a++)if(e[n].toLowerCase()==t[a].toLowerCase())return[n,a];return null}function f(){var e=i(l(o.selection.element()).css("font-family")),t=[];for(var n in o.opts.fontFamily)if(o.opts.fontFamily.hasOwnProperty(n)){var a=r(e,i(n));a&&t.push([n,a])}return 0===t.length?null:(t.sort(function(e,t){var n=e[1][0]-t[1][0];return 0===n?e[1][1]-t[1][1]:n}),t[0][0])}return{apply:function(e){o.format.applyStyle("font-family",e)},refreshOnShow:function(e,t){t.find(".fr-command.fr-active").removeClass("fr-active").attr("aria-selected",!1),t.find('.fr-command[data-param1="'+f()+'"]').addClass("fr-active").attr("aria-selected",!0);var n=t.find(".fr-dropdown-list"),a=t.find(".fr-active").parent();a.length?n.parent().scrollTop(a.offset().top-n.offset().top-(n.parent().outerHeight()/2-a.outerHeight()/2)):n.parent().scrollTop(0)},refresh:function(e){if(o.opts.fontFamilySelection){var t=l(o.selection.element()).css("font-family").replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'|/g,"").split(",");e.find("> span").text(o.opts.fontFamily[f()]||t[0]||o.language.translate(o.opts.fontFamilyDefaultSelection))}}}},l.FE.RegisterCommand("fontFamily",{type:"dropdown",displaySelection:function(e){return e.opts.fontFamilySelection},defaultSelection:function(e){return e.opts.fontFamilyDefaultSelection},displaySelectionWidth:120,html:function(){var e='<ul class="fr-dropdown-list" role="presentation">',t=this.opts.fontFamily;for(var n in t)t.hasOwnProperty(n)&&(e+='<li role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="fontFamily" data-param1="'+n+'" style="font-family: '+n+'" title="'+t[n]+'">'+t[n]+"</a></li>");return e+"</ul>"},title:"Font Family",callback:function(e,t){this.fontFamily.apply(t)},refresh:function(e){this.fontFamily.refresh(e)},refreshOnShow:function(e,t){this.fontFamily.refreshOnShow(e,t)},plugin:"fontFamily"}),l.FE.DefineIcon("fontFamily",{NAME:"font"})});