import 'bootstrap-maxlength';
$(document).ready(function() {
  $('input[maxlength], textarea').maxlength({
    alwaysShow: true,
    warningClass: "form-text text-muted mt-1",
    limitReachedClass: "form-text text-muted mt-1",
    placement: 'bottom-right-inside'
  });
});
