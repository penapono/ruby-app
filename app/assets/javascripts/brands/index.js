$(function() {
  'use strict';

  $(document).on("change", "select", function() {
    var self = $(this),
        brand_id = self.val(),
        link = self.closest('div').find('#link_to_models'),
        new_address = "/brands/" + brand_id + "/models";

    link.attr('href', new_address);
  });
});
