// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function dlog(str) {
	if (typeof(window["console"]) != "undefined") {
		console.log(str);
	}
}

// Adapted from http://www.github.com/timriley/complex-form-examples
$(function() {
  $('form a.add_child').live('click', function() {
    // Setup
    var field_type   = $(this).attr('data-field-type');           // Name of child
    var content = $('#' + field_type + '_fields_template').html(); // Fields template
	if (content) {
		dlog("Got " + field_type + " template\n");
	} else {
		dlog("Failed to get " + field_type + " template\n");
	}
    
	dlog("Add field clicked, field type " + field_type + "\n");

    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
	// TODO: make this work for empty surveys, field_groups
	// TODO: i.e. it needs to fall back if the input isn't found,
	//  or else look for some other breadcrumb to figure out where it is
	var raw_context = ($(this).parents('.element:first').children('input:first').attr('name') || '')
	var context = raw_context.replace(new RegExp('\\[[a-z]+\\]$'), '');
    
    // context will be something like this for a brand new form:
    // survey_schema[field_groups_attributes][1255929127459][fields_attributes][1255929128105]
    // or for an edit form:
    // survey_schema[field_groups_attributes][0][fields_attributes][1]
    if(context) {
	  dlog("Got context: " + context + "\n");
      var parent_names = context.match(/[a-z_]+_attributes/g) || []
      var parent_ids   = context.match(/[0-9]+/g)
      
      for(i = 0; i < parent_names.length; i++) {
        if(parent_ids[i]) {
          content = content.replace(
            new RegExp('(\\[' + parent_names[i] + '\\])\\[.+?\\]', 'g'),
            '$1[' + parent_ids[i] + ']'
          )
        }
      }
    } else {
	  dlog("Failed to retrieve context!\n");
	}
    
    // Make a unique ID for the new child 
    var regexp  = new RegExp('new_' + field_type, 'g');
    var new_id  = new Date().getTime();
    content     = content.replace(regexp, new_id)
        
	var insertion_point = $(this).parents('.addbox:first');
	insertion_point.before(content);
    return false;
  });
  
  $('form a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parents('.element:first').hide();
    return false;
  });

  $('form a.add_child').attr('href', 'javascript:void(0)');
});
