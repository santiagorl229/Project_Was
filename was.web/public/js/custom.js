var ip_server = "http://localhost:4000/";
var sck_server = "ws://localhost:4000/";
//http://localhost:4000/
//http://54.68.101.62:4001/

$.put = function(url, data, callback, type){

  if ( $.isFunction(data) ){
    type = type || callback,
    callback = data,
    data = {}
  }

  return $.ajax({
    url: url,
    type: 'PUT',
    success: callback,
    data: data,
    contentType: type
  });
}
$.delete = function(url, data, callback, type){

  if ( $.isFunction(data) ){
    type = type || callback,
        callback = data,
        data = {}
  }

  return $.ajax({
    url: url,
    type: 'DELETE',
    success: callback,
    data: data,
    contentType: type
  });
}


function tabla_editable(){
  var ide;
  $('.js-editable-table tr').editable({
    keyboard: true,
    dblclick: true,
    button: true,
    buttonSelector: '.js-edit',
    maintainWidth: true,
    edit: function (values) {
      $('.js-edit i', this).removeClass('hs-admin-pencil').addClass('hs-admin-check g-color-lightblue-v3');
      ide = $('.js-edit', this).attr('id');
      $('.js-edit', this).attr('onclick','guarda('+ide+')');
    },
    save: function (values) {
      $('.js-edit i', this).removeClass('hs-admin-check g-color-lightblue-v3').addClass('hs-admin-pencil');

    }
  });
}

function notita_exitosa() {
  var newNoty = new Noty({
    "type": "success",
    "layout": "topRight",
    "timeout": "3000",
    "animation": {
      "open": "animated jackInTheBox",
      "close": "animated zoomOutRight"
    },
    "closeWith": [
      "click"
    ],
    "text": "<div class=\"g-mr-20\"><div class=\"noty_body__icon\"><i class=\"hs-admin-check\"></i></div></div><div>Mensaje<br>Operación exitosa</div>",
    "theme": "unify--v1"
  }).show();
}
function notita_exitosa2() {
  var newNoty = new Noty({
    "type": "success",
    "layout": "topRight",
    "timeout": "1000",
    "animation": {
      "open": "animated jackInTheBox",
      "close": "animated zoomOutRight"
    },
    "closeWith": [
      "click"
    ],
    "text": "<div class=\"g-mr-20\"><div class=\"noty_body__icon\"><i class=\"hs-admin-check\"></i></div></div><div>Mensaje<br>Operación exitosa</div>",
    "theme": "unify--v1"
  }).show();
}
function notita_eliminado() {
  var newNoty = new Noty({
    "type": "success",
    "layout": "topRight",
    "timeout": "3000",
    "animation": {
      "open": "animated jackInTheBox",
      "close": "animated zoomOutRight"
    },
    "closeWith": [
      "click"
    ],
    "text": "<div class=\"g-mr-20\"><div class=\"noty_body__icon\"><i class=\"hs-admin-check\"></i></div></div><div>Mensaje<br>Se ha eliminado el registro</div>",
    "theme": "unify--v1--dark"
  }).show();
}
function edValueKeyPress(){
  setTimeout(function(){
    var canti = $("tbody tr").length;
    var re = $("tbody tr")[0].innerText;
    if (re == "No matching records found") {
      canti = 0;
    }
    $(".cantidad_registros").text(canti);
  }, 500);
}


function createCookie(name,value,days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime()+(days*24*60*60*1000));
        var expires = "; expires="+date.toGMTString();
    }
    else var expires = "";
    document.cookie = name+"="+value+expires+"; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}
