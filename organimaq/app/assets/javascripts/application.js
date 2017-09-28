// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require modals

//= require bootstrap

//= require bootstrap_sb_admin_base_v2

//= require moment

//= require_tree 
//= javascript_include_tag :application



 var calculaDigitoVerificador = function (rut) {

     
  // type check
  if (!rut || !rut.length || typeof rut !== 'string') {
    return -1;
  }
  // serie numerica
  var secuencia = [2,3,4,5,6,7,2,3];
  var sum = 0;
  //
  for (var i=rut.length - 1; i >=0; i--) {
    var d = rut.charAt(i)
    sum += new Number(d)*secuencia[rut.length - (i + 1)];
  };
  // sum mod 11
  var rest = 11 - (sum % 11);
  // si es 11, retorna 0, sino si es 10 retorna K,
  // en caso contrario retorna el numero
  return rest === 11 ? 0 : rest === 10 ? "K" : rest;
};

