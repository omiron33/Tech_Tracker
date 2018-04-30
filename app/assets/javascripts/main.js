
$(document).ready(function () {

    $('select').on('change', function () {
        console.log("list item selected");
        var value = $('select[name=sku-dropdown]').val();
        console.log(value)
        

        

    });


});