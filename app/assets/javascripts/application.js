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
//= require_tree ./shared
//= require intlTelInput
//= require libphonenumber/utils

function showModal(){
	$('.ui.modal').modal('show');
}

function appendModal(html){
	$("#modal").html(html)
	showModal();
}

function toggleSideBar(){
    $('.ui.sidebar').sidebar('toggle');
}

$(document).on('ready', function(){
    removeAlerts();
    $('.close-alert').on('click', function(){
        console.log('clicked');
        $(this).parent.remove();
    });

    
  $('#main-nav .ui.dropdown').dropdown();
});

function displayAlert(message){
    console.log(message);
    try{
        var json = JSON.parse(message.responseText);
        var keys = Object.keys(json);
        var values = Object.values(json);
        $.each(keys, function(pos, key){
            $.each(values[pos], function(pos2, val){
                appendAlert(key +" : "+ val);
            })
        });
    }catch(err){
        if (Boolean(message.responseJSON.error))
            appendAlert(JSON.parse(message.responseText).error)
        else
            appendAlert("Couldn't complete operation");
    }
    removeAlerts();
}

function appendAlert(msg, isTimed = false){
  $('#alert-holder').append('<div class="text-right pad1"><span class="alert"><span>' + msg + '</span> <i class="remove icon close-alert"></i></span></div>');
  if (isTimed) removeAlerts();
}


function removeAlerts(){
    if ($('.alert').length > 0){
        setTimeout(function(){
            $('.alert').each(function(i, obj){
                $(obj).parent().remove();
            })
        }, 5000)
    }
}

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};


function flattenNested(graph, props) {
  var i, l,
  nodes=[],
  visited=[];

  function clone(n) {
     var i,l,
         result={};
     for (i = 0, l = props.length; i < l; i++) { 
        if (n[props[i]]) {
          result[props[i]]= n[props[i]];
        }
     }
     return result;
  }

  function helper (node) {
    var i, limit;
    if (visited.indexOf(node.id) == -1) {
      visited.push(node.id);
      nodes.push(clone(node));
      if( node.children) {
        for (i = 0, limit = node.children.length; i < limit; i++) {
          helper(node.children[i]);
        }
      }
    }
  }

  for (i = 0, l = graph.length; i < l; i++) {
    helper(graph[i]);
  }

  return nodes;
}

function prune(array, id) {
    for (var i = 0; i < array.length; ++i) {
        var obj = array[i];
        if (obj.id === id) {
            array.splice(i, 1);
            return true;
        }
        if (obj.children) {
            if (prune(obj.children, id)) {
                return true;
            }
        }
    }
}

function cancelParentEvent(){
  if (!e) var e = window.event;
  e.cancelBubble = true;
  if (e.stopPropagation) e.stopPropagation();
}

function initPhoneInput(id, countryCode = ''){
    $(id).intlTelInput({
        formatOnInit: true,
        separateDialCode: true,
        utilsScript: "assets/libphonenumber/utils.js",
        initialCountry: countryCode,
    });
}
