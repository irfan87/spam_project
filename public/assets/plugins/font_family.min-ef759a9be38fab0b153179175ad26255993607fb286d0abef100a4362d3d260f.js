/*!
 * froala_editor v2.0.5 (https://www.froala.com/wysiwyg-editor)
 * License https://froala.com/wysiwyg-editor/terms
 * Copyright 2014-2015 Froala Labs
 */


!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof module&&module.exports?module.exports=function(b,c){return void 0===c&&(c="undefined"!=typeof window?require("jquery"):require("jquery")(b)),a(c),c}:a(jQuery)}(function(a){"use strict";a.extend(a.FroalaEditor.DEFAULTS,{fontFamily:{"Arial,Helvetica,sans-serif":"Arial","Georgia,serif":"Georgia","Impact,Charcoal,sans-serif":"Impact","Tahoma,Geneva,sans-serif":"Tahoma","'Times New Roman',Times,serif":"Times New Roman","Verdana,Geneva,sans-serif":"Verdana"},fontFamilySelection:!1,fontFamilyDefaultSelection:"Time New Roman"}),a.FroalaEditor.PLUGINS.fontFamily=function(b){function c(a){b.commands.applyProperty("font-family",a)}function d(c,d){var e=a(b.selection.element()).css("font-family").replace(/"/g,"'").replace(/, /g,",");d.find(".fr-command.fr-active").removeClass("fr-active"),d.find('.fr-command[data-param1="'+e+'"]').addClass("fr-active");var f=d.find(".fr-dropdown-list"),g=d.find(".fr-active").parent();g.length?f.parent().scrollTop(g.offset().top-f.offset().top-(f.parent().outerHeight()/2-g.outerHeight()/2)):f.parent().scrollTop(0)}function e(c,d){var e=a(b.selection.element()).css("font-family").replace(/"/g,"'").replace(/, /g,",");c.find("> span").text(d.find('.fr-command[data-param1="'+e+'"]').text()||b.opts.fontFamilyDefaultSelection)}return{apply:c,refreshOnShow:d,refresh:e}},a.FroalaEditor.RegisterCommand("fontFamily",{type:"dropdown",displaySelection:function(a){return a.opts.fontFamilySelection},defaultSelection:function(a){return a.opts.fontFamilyDefaultSelection},displaySelectionWidth:120,html:function(){var a='<ul class="fr-dropdown-list">',b=this.opts.fontFamily;for(var c in b)a+='<li><a class="fr-command" data-cmd="fontFamily" data-param1="'+c+'" style="font-family: '+c+'" title="'+b[c]+'">'+b[c]+"</a></li>";return a+="</ul>"},title:"Font Family",callback:function(a,b){this.fontFamily.apply(b)},refresh:function(a,b){this.fontFamily.refresh(a,b)},refreshOnShow:function(a,b){this.fontFamily.refreshOnShow(a,b)}}),a.FroalaEditor.DefineIcon("fontFamily",{NAME:"font"})});
