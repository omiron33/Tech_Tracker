
$(document).ready(function () {

    $('select[name=sku_dropdown]').on('change', function () {
        console.log("list item selected");
        var value = $('select[name=sku-dropdown]').val();
        console.log(value);
        $('#sku-dropdown-desc').append();
    });


});