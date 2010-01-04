// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Adapted from http://www.github.com/timriley/complex-form-examples
$(function() {
  $('form a.add_child').live('click', function() {
    // Setup
    var field_type   = $(this).attr('data-field-type');           // Name of child
    var content = $('#' + field_type + '_fields_template').html(); // Fields template
    
    // Make the context correct by replacing new_<parents> with the generated ID
    // of each of the parent objects
    var context = ($(this).parents('.element').children('input:first').attr('name') || '').replace(new RegExp('\[[a-z]+\]$'), '');
    
    // context will be something like this for a brand new form:
    // project[tasks_attributes][1255929127459][assignments_attributes][1255929128105]
    // or for an edit form:
    // project[tasks_attributes][0][assignments_attributes][1]
    if(context) {
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
    }
    
    // Make a unique ID for the new child 
    var regexp  = new RegExp('new_' + field_type, 'g');
    var new_id  = new Date().getTime();
    content     = content.replace(regexp, new_id)
        
    $(this).parent().children('.element:last').after(content);
    return false;
  });
  
  $('form a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parent('.element').hide();
    return false;
  });
});
