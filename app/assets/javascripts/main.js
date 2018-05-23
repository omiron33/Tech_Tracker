
$(document).ready(function () {

    $('#sku-dropdown').change(function () {
        var value = $('#sku-dropdown').prop('selectedIndex');
        var sku = $('#sku-dropdown').val();
        $('#desc-dropdown').prop('selectedIndex', value);
        $('#model-dropdown').prop('selectedIndex', value);
        $("input[name='skulist_sku']").attr("value", sku);
        $('#comp-submit').show();
    });

    $('#desc-dropdown').change(function () {
        var value = $('#desc-dropdown').prop('selectedIndex');
        $('#sku-dropdown').prop('selectedIndex', value);
        $('#model-dropdown').prop('selectedIndex', value);
        var sku = $('#sku-dropdown').val();
        $("input[name='skulist_sku']").attr("value", sku);
        $('#comp-submit').show();
    });

    $('#model-dropdown').change(function () {
        var value = $('#model-dropdown').prop('selectedIndex');
        $('#desc-dropdown').prop('selectedIndex', value);
        $('#sku-dropdown').prop('selectedIndex', value);
        var sku = $('#sku-dropdown').val();
        $("input[name='skulist_sku']").attr("value", sku);
        $('#comp-submit').show();
    });



});



