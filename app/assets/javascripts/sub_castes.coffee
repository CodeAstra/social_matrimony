$ ->
  $('#candidate_caste_input').change ->
    $.ajax
      url: "sub_castes"
      data:
        caste_id : $('#candidate_caste_input').val()
      dataType: "script"
